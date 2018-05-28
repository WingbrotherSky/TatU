json.users do
    json.array! @conversers do |user|
        json.user_id user.id
        if user.shop
            json.shop true
            json.name user.shop.name
            json.logo_url user.shop.logo_url
        else
            json.shop false
            json.name user.username
            json.avatar_url user.avatarUrl
        end
    end
end