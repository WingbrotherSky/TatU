json.users do
    p @conversers
    json.array! @conversers do |user|
        json.user_id user.id
        if user.shop
            json.shop do
                json.shop true
                json.id shop.id
                json.name user.shop.name
                json.logo_url user.shop.logo_url
            end
        else
            json.shop false
            json.name user.username
            json.avatar_url user.avatarUrl
        end
    end
end