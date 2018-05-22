# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shop_data = {
  name: "Temple Tattoo",
  description: "The coolest, safest tattoo studio in Chengdu. We do a lot of cool stuff I'm not going to go through in mock",
  location: { lat: "39.9054895", long: "116.3976317"},
  phone_number: "12345678912",
  banner_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQmVwNbaXuXLHUXHBiew8s6W5ur4MSXt7cQx0PAd8wsAKjh434",
  logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2MZ6dVHf6bCHWgOY-eJ9DHzzjUpb02q9Af-8-3MhN8mjO634-PA",
  user_id: 1,
  qr_url: "https://upload.wikimedia.org/wikipedia/commons/0/0b/QR_code_Wikimedia_Commons_%28URL%29.png"
}

artist1 = {
  name: "Tianyang",
  avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6oUP6AlEYMAG0marnLLRVZ21mZ1Ol_xlKbxXc2SCnpuCbDxzO",
  years_of_experience: 6,
  weibo_url: "https://weibo.com/u/2511311662?refer_flag=1001030103_&is_hot=1#_loginLayer_1526959157437"
}

artist2 = {
  name: "Mutou",
  avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3SSTAuIsVDpTmBNUJp_xqz7-b3c3Z_AQG4BX3qCmTKxOyFoe7tw",
  years_of_experience: 4,
  weibo_url: "https://weibo.com/u/2511311662?refer_flag=1001030103_&is_hot=1#_loginLayer_1526959157437"
}

artists = [artist1, artist2]

artists.each do |artist|
  Artist.create(artist)
end

3.times do
  user = User.new(email: "#{(0..100).to_a.sample}@email.com", password: "12345678")
  shop = Shop.new(shop_data)
  shop.user = user
  shop.save
  artists.each do |artist|
   a = Artist.new(artist)
   a.shop = shop
   a.save
  end
end

