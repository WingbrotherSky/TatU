# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
require 'securerandom'


shop_data = {
  name: "Temple Tattoo",
  description: "The coolest, safest tattoo studio in Chengdu. We do a lot of cool stuff I'm not going to go through in mock",
  location: { lat: "39.9054895", long: "116.3976317"},
  phone_number: "12345678912",
  banner_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQmVwNbaXuXLHUXHBiew8s6W5ur4MSXt7cQx0PAd8wsAKjh434",
  logo_url: "https://res.cloudinary.com/dwtivbec9/image/upload/v1527187701/templetattoo.jpg",
  user_id: 1,
  qr_url: "https://upload.wikimedia.org/wikipedia/commons/0/0b/QR_code_Wikimedia_Commons_%28URL%29.png"
}

artist1 = {
  name: "Zen",
  avatar_url: "https://res.cloudinary.com/dwtivbec9/image/upload/v1527180821/profile.jpg",
  years_of_experience: 6,
  weibo_url: "https://weibo.com/u/2511311662?refer_flag=1001030103_&is_hot=1#_loginLayer_1526959157437",
  style_list: ["Japanese New Traditional"]
}

artist2 = {
  name: "Zen",
  avatar_url: "https://res.cloudinary.com/dwtivbec9/image/upload/v1527180821/profile.jpg",
  years_of_experience: 6,
  weibo_url: "https://weibo.com/u/2511311662?refer_flag=1001030103_&is_hot=1#_loginLayer_1526959157437",
  style_list: ["Japanese New Traditional"]
}

artists = [artist1, artist2]

artists.each do |artist|
  Artist.create(artist)
end


zen_art_urls = %w[https://res.cloudinary.com/dwtivbec9/image/upload/v1527180823/WechatIMG831527172503_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180822/WechatIMG791527172501_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180822/WechatIMG821527172502_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180821/WechatIMG801527172502_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180816/WechatIMG711527172437_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180815/WechatIMG691527172434_.pic_hd.jpg]
3.times do
  user = User.new(email: "#{(0..100).to_a.sample}@email.com", password: "12345678", auth_key: SecureRandom.hex(16))
  user.save
  inbox = Inbox.new
  inbox.user = user
  inbox.save
  shop = Shop.new(shop_data)
  shop.user = user
  shop.save
  artists.each do |artist|
   a = Artist.new(artist)
   a.shop = shop
   a.save
   zen_art_urls.each do |url|
    art = Art.new(artist_id: a.id, url: url, primary:false)
    art.save
   end
  end
end

