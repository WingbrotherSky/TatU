art = @art

json.id art.id
json.url art.url
json.primary art.primary
json.artist do
  artist = art.artist
  json.id artist.id
  json.name artist.name
  json.avatar_url artist.avatar_url
  json.shop do
    shop = artist.shop
    json.id shop.id
    json.name shop.name
    json.log_url shop.logo_url
    json.location shop.location
    json.phone_number shop.phone_number
  end
end
