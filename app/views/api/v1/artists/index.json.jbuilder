json.artists do
    json.array! @artists do |artist|
        json.id artist.id
        json.name artist.name
        json.avatar_url artist.avatar_url
        json.years_of_experience artist.years_of_experience
        json.weibo_url artist.weibo_url
        json.tags do
            json.array! artist.style_list do |style|
              json.style style
            end
          end
        json.shop do
            shop = artist.shop
            json.id shop.id
            json.name shop.name
            json.logo_url shop.logo_url
        end
        json.art do
            json.array! artist.arts do |art|
                json.id art.id
                json.url art.url
                json.primary art.primary
            end
        end
    end
end