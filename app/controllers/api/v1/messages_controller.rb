class Api::V1::MessagesController < Api::V1::BaseController
  def create
    @message = Message.new()
    @message.user = @current_user
    @message.content = params[:content]
    @message.inbox = Inbox.find_by(user_id: params[:user_id])
    if @message.send
      success_message
    else
      error_message(@message)
    end
  end
end
