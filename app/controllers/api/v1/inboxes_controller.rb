class Api::V1::InboxesController < Api::V1::BaseController
  def list_messages
    @inbox = Inbox.find_by(user_id: @current_user.id)
    @messages = @inbox.messages
  end
end
