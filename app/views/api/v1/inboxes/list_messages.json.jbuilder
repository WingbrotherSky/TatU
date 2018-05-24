messages = @messages
json.messages do
  json.array messages do |message|
    json.id message.id
    json.from message.user.id
    json.content message.content
  end
end
