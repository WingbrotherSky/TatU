json.messages do
    json.array! @conversation do |message|
        json.id message.id
        json.sender message.user_id
        json.content message.content
        json.time message.created_at
    end
end