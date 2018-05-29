class LoginController < Api::V1::BaseController
   URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def login
    if params[:auth_key]
      login_with_auth
    else
      login_without_auth
    end
  end

  def update
    auth = params[:auth_key]
    wechat_data = params[:userInfo]
    @user = User.find_by(auth_key: auth)
    if @user.update(user_profile_params)
      success_message
    else
      error_message(@user)
    end
  end



  private

  def user_profile_params
    params.require(:userInfo).permit(
        :auth_key,
        :avatarUrl,
        :city,
        :country,
        :gender,
        :language,
        :nickName,
        :province)
  end


  def login_without_auth
    @user = User.where(openid: wechat_user.fetch('openid')).first_or_initialize
    unless @user.auth_key
      @user.auth_key = SecureRandom.hex(16)
    end
    unless @user.email
      @user.email = "#{@user.auth_key}@email.com"
    end
    if @user.save
      @inbox = Inbox.new()
      @inbox.user = @user
      @inbox.save
      render json: {
          auth_key: @user.auth_key
        }
    else
      p "USER SAVE ERROR---------------------------------------------------- #{@user.errors.messages}"
      error_message(@user.errors.messages)
    end
  end

  def login_with_auth
  auth = params[:auth_key]
  @user = User.find_by(auth_key: auth)
  if @user
    render json: {
      userInfo: {
        avatarUrl:@user.avatarUrl,
        city: @user.city,
        country: @user.country,
        gender: @user.gender,
        language: @user.language,
        nickName: @user.nickName,
        province: @user.province
      }
    }
  else
    render json: {
      errors: "Invalid auth_key"
    }
  end
  end

  def wechat_params
  {
    appid: ENV['appId'],
    secret: ENV['appSecret'],
    js_code: params[:code],
    grant_type: 'authorization_code'
  }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
    p "WECHAT USER-------------------------------------------------------------------- #{@wechat_user}"
  end
end
