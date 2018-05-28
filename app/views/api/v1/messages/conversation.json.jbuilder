json.messages do 
    json.array! @conversation do |message|
        json.id message.id
        json.date message.created_at
        json.received message.user == @current_user ? false : true
        json.sender do
            sender = message.user
            json.id sender.id
            json.name sender.nickName
            if sender.shop
                json.shop do 
                    shop = sender.shop
                    json.id shop.id
                    json.name shop.name
                    json.logo_url shop.logo_url
                end
            else
                json.avatar_url sender.avatarUrl
            end
        end
        json.content message.content
    end
end

