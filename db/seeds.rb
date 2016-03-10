# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all

urls = [
  "http://www.fndvisions.org/img/cutecat.jpg",
  "http://images6.fanpop.com/image/photos/33400000/Cute-Cats-cats-33440930-1280-800.jpg",
  "http://jasonlefkowitz.net/wp-content/uploads/2013/07/Cute-Cat-Photos-wallpaper.jpg",
  "http://www.awwify.com/panel/crawler/imgs/old/Cute-Cats-5.jpg",
  "http://cutecats.com/wp-content/uploads/2015/03/lily_5-515x276.jpg",
  "http://tonsofcats.com/wp-content/uploads/2013/08/eb6d9fe3e3c836711bd68bb045c55d6b.jpg",
  "http://www.laughspark.info/thumbfiles/705X705/cute-cats-image-playing-635757323663331714-15541.jpg",
  "https://i.ytimg.com/vi/-HE3jj5Ah2M/maxresdefault.jpg"
]

urls.each do |url|
  Cat.create!(
    url: url,
    elo_score: 1000)
end