class LoginController < Api::V1::BaseController
   URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def login
    @user = User.where(openid: wechat_user.fetch('openid')).first_or_initialize
    if @user.save
      render json: {
          userId: @user.id
        }
    else
      error_message(@user)
    end
  end

  private

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
