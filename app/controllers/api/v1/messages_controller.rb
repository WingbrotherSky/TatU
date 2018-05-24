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

  def conversation
    @target = params[:user_id]
    @my_messages = Message.where("user_id = ? AND inbox_id = ?", [@current_user.id, @target.inbox.id])
    @their_messages = Message.where("user_id = ? AND inbox_id = ?", [@target.id, @current_user.inbox.id])
    @conversation = (@my_messages + @their_messages).sort_by { |message| message.created_at }
  end
  

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
