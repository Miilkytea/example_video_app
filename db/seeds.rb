# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Band.destroy_all
MusicVideo.destroy_all

mac = Band.create(
  name:  "Fleetwood Mac", 
  genre: "Country Rock"
)
ham = Band.create(
  name:  "Haim",
  genre: "Country Rock Revival Pop"
)

mac.music_videos << MusicVideo.create(
  title:           "Landslide", 
  video_embed_uri: "ZqCotgdEZsk"
)
mac.music_videos << MusicVideo.create(
  title:           "Blue Letter", 
  video_embed_uri: "7DKlOD9Qs_k"
)
mac.music_videos << MusicVideo.create(
  title:           "Never Going Back Again", 
  video_embed_uri: "GGyCx9WgGV8"
)

ham.music_videos << MusicVideo.create(
  title:           "Save Me", 
  video_embed_uri: "kiqIush2nTA"
)
ham.music_videos << MusicVideo.create(
  title:           "Forever", 
  video_embed_uri: "sEwM6ERq0gc"
)
