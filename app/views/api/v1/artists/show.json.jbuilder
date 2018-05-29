artist = @artist

json.id artist.id
json.name artist.name
json.avatar_url artist.avatar_url
json.years_of_experience artist.years_of_experience
json.weibo_url artist.weibo_url
json.shop_logo_url artist.shop.logo_url
json.tags do
  json.array! artist.style_list do |style|
    json.style style
  end
end
json.art do
  json.array! artist.arts do |art|
    json.id art.id
    json.url art.url
    json.primary art.primary
    json.favorited Favorite.where(user_id: @current_user.id, art_id: art.id).present?
  end
end
