json.shops do
  json.array! @shops do |shop|
    json.id shop.id
    json.name shop.name
    json.description shop.description
    json.location shop.location
    json.phone_number shop.phone_number
    json.banner_url shop.banner_url
    json.logo_url shop.logo_url
    json.user_id shop.user_id
    json.qr_url  shop.qr_url
    json.artists do
      json.array! shop.artists do |artist|
        json.name artist.name
        json.avatar_url artist.avatar_url
        json.shop_id artist.shop_id
        json.years_of_experience artist.years_of_experience
        json.weibo_url artist.weibo_url
        json.art do
          art = Art.where(artist_id: artist.id).limit(9)
          json.array! art do |a|
            json.id a.id
            json.url a.url
          end
        end
      end
    end
  end
end
