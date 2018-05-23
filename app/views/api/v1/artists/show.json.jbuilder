artist = @artist

json.id artist.id
json.name artist.name
json.avatar_url artist.avatar_url
json.years_of_experience artist.years_of_experience
json.weibo_url artist.weibo_url
json.arts do
  json.array! artist.arts do |art|
    json.id art.id
    json.url art.url
    json.primary art.primary
  end
end
