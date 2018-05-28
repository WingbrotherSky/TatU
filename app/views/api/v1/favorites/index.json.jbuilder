favs = @favorites
json.favorites do
  json.array! favs do |f|
    json.id f.id
    json.user_id f.user.id
    json.art do
      art = f.art
      json.id art.id
      json.url art.url
      json.primary art.primary
      json.artist do
        artist = art.artist
        json.id artist.id
        json.name artist.name
        json.avatar_url artist.avatar_url
        json.years_of_experience artist.years_of_experience
        json.weibo_url artist.weibo_url
        json.styles do
          json.array! artist.style_list do |style|
            json.name style
          end
        end
        json.shop  do 
          shop = artist.shop
          json.id shop.id
          json.name shop.name
          json.logo_url shop.logo_url
        end
      end
    end
  end
end
