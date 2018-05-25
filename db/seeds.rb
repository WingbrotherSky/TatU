# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
require 'securerandom'

SHOPS = {

temple_tattoo_data: {
  name: "Temple Tattoo",
  description: "The coolest, safest tattoo studio in Chengdu. We do a lot of cool stuff I'm not going to go through in mock",
  location: { lat: "39.9054895", long: "116.3976317"},
  phone_number: "12345678912",
  banner_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQmVwNbaXuXLHUXHBiew8s6W5ur4MSXt7cQx0PAd8wsAKjh434",
  logo_url: "https://res.cloudinary.com/dwtivbec9/image/upload/v1527187701/templetattoo.jpg",
  user_id: 1,
  qr_url: "https://upload.wikimedia.org/wikipedia/commons/0/0b/QR_code_Wikimedia_Commons_%28URL%29.png"
}

}

ARTISTS = {
temple_tattoo_artists: [
  
  {
    name: "Zen",
    avatar_url: "https://res.cloudinary.com/dwtivbec9/image/upload/v1527180821/profile.jpg",
    years_of_experience: 6,
    weibo_url: "https://weibo.com/u/2511311662?refer_flag=1001030103_&is_hot=1#_loginLayer_1526959157437",
    style_list: ["Japanese New Traditional"]
  },
  
  {
    name: "Tianyang",
    avatar_url: "https://res.cloudinary.com/dwtivbec9/image/upload/v1527234366/tianyangprofile.jpg",
    years_of_experience: 6,
    weibo_url: "https://weibo.com/u/2511311662?refer_flag=1001030103_&is_hot=1#_loginLayer_1526959157437",
    style_list: ["New School"]
  },

  {
    name: "Mutou",
    avatar_url:"https://res.cloudinary.com/dwtivbec9/image/upload/v1527236265/WechatIMG1651527174919_.pic_hd.jpg" ,
    years_of_experience: 6,
    weibo_url: "https://weibo.com/u/2511311662?refer_flag=1001030103_&is_hot=1#_loginLayer_1526959157437",
    style_list: ["American Traditional", "Old School"]
  }
  ]
}

ARTS = {
  temple_tattoo_arts: [
    {
  artist_name: "Zen",
  arts: %w[https://res.cloudinary.com/dwtivbec9/image/upload/v1527180823/WechatIMG831527172503_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180822/WechatIMG791527172501_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180822/WechatIMG821527172502_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180821/WechatIMG801527172502_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180816/WechatIMG711527172437_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527180815/WechatIMG691527172434_.pic_hd.jpg],
  },
  {
    artist_name: "Tianyang",
    arts: %w[https://res.cloudinary.com/dwtivbec9/image/upload/v1527234364/unnamed.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234364/unnamed_2.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234365/unnamed_1.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234365/unnamed_3.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234365/unnamed_4.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234366/unnamed_5.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234366/unnamed_9.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234366/unnamed_6.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234367/unnamed_11.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234367/unnamed_10.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234367/unnamed_8.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234367/unnamed_12.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234366/unnamed_7.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234368/unnamed_15.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234368/unnamed_13.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234368/unnamed_16.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234369/unnamed_17.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527234369/unnamed_14.jpg]
  },
  {
    artist_name: "Mutou",
    arts: %w[https://res.cloudinary.com/dwtivbec9/image/upload/v1527236250/WechatIMG1121527172866_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236250/WechatIMG1131527172866_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236251/WechatIMG1151527172868_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236255/WechatIMG1171527172868_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236257/WechatIMG1141527172867_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236258/WechatIMG1221527172915_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236260/WechatIMG1211527172914_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236259/WechatIMG1241527172916_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236260/WechatIMG1321527172979_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236260/WechatIMG1311527172978_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236261/WechatIMG1281527172977_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236261/WechatIMG1291527172978_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236262/WechatIMG1091527172865_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236263/WechatIMG1371527173026_.pic_hd.jpg https://res.cloudinary.com/dwtivbec9/image/upload/v1527236267/WechatIMG1361527173025_.pic_hd.jpg]
  }
  ]
}


temple_tattoo_user = User.new(email:"templetattoo@email.com", password:123123)
temple_tattoo_user.auth_key = SecureRandom.hex(16)
temple_tattoo_user.save

temple_tattoo = Shop.new(SHOPS[:temple_tattoo_data])
temple_tattoo.user = temple_tattoo_user
temple_tattoo.save

temple_tattoo_inbox = Inbox.new()
temple_tattoo_inbox.user = temple_tattoo_user
temple_tattoo_inbox.save

ARTISTS[:temple_tattoo_artists].each do |artist|
  new_artist = Artist.new(artist)
  new_artist.shop = temple_tattoo
  new_artist.save
end

ARTS[:temple_tattoo_arts].each do |art|
  art[:arts].each do |a|
    new_art = Art.new()
    new_art.artist = Artist.find_by(name: art[:artist_name])
    new_art.url = a
    new_art.save
  end
end









