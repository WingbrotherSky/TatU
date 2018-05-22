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
    if @user.update(wechat_data)
      success_message
    else
      error_message(@user)
    end
  end



  private

   def login_without_auth
      @user = User.where(openid: wechat_user.fetch('openid')).first_or_initialize
      unless @user.auth_key
        @user.auth_key = SecureRandom.hex(16)
      end
      if @user.save
        render json: {
            auth_key: @user.auth_key
          }
      else
        error_message(@user)
      end
    end

  def login_with_auth
    auth = params[:auth_key]
    if User.find_by(auth_key: auth)
      render json: {
        userInfo: {
          avatarUrl:"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIJW2zkn2aIStOgTZfLcbIlLuFOWk5mic6icpTLvTvtIkvpRq5ou4Xcm4wPxiaPibAtND5Oh4QSaTS65Q/132",
          city: "Chengdu",
          country: "China",
          gender: 1,
          language: "en",
          nickName: "Jake",
          province: "Sichuan"
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
  end
end
