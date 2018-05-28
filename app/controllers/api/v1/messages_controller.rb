class Api::V1::MessagesController < Api::V1::BaseController
  def create
    @message = Message.new()
    @message.user = @current_user
    @message.content = params[:content]
    artist = Artist.find(params[:user_id])
    shop = artist.shop
    shop_owner = shop.user
    @message.inbox = Inbox.find_by(user_id: shop_owner.id)
    if @message.save
      success_message
    else
      error_message(@message)
    end
  end

  def conversations
    all_messages = Message.where(user_id: @current_user.id).or( Message.where(inbox_id: @current_user.inbox.id))
    conversers =[]
    all_messages.each do |message|
      if message.user == @current_user
        conversers << message.inbox.user
      else
        conversers << message.user
      end
    end
    @conversers = conversers.uniq!
  end
  

  def conversation
    @target = User.find(params[:user_id])
    @my_messages = Message.where(user_id: @current_user.id, inbox_id: @target.inbox.id)
    @their_messages = Message.where(user_id: @target.id, inbox_id: @current_user.inbox.id)
    @conversation = (@my_messages + @their_messages).sort_by { |message| message.created_at }
  end
  

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
