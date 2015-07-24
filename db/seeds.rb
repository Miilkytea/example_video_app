# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# order the destroys so that we start with the
# has_manys, and then the belongs_to... avoids
# cascade errors
BandRep.destroy_all
MusicVideo.destroy_all
Band.destroy_all

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

# here we need to use .new/.save instead of .create,
# because has_secure_password uses .save to check that
# password and password_confirmation align!
pj = BandRep.new(
  username: "pj@ga.co",
  password: "test",
  password_confirmation: "test"
)

ham.band_reps << pj
