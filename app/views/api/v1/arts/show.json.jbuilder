art = @art

json.id art.id
json.url art.url
json.primary art.primary
json.favorited Favorite.where(user_id: @current_user.id, art_id: art.id).present?
json.artist do
  artist = art.artist
  json.id artist.id
  json.name artist.name
  json.avatar_url artist.avatar_url
  json.shop do
    shop = artist.shop
    json.id shop.id
    json.name shop.name
    json.logo_url shop.logo_url
    json.location shop.location
    json.phone_number shop.phone_number
  end
end
