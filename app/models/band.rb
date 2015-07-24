class Band < ActiveRecord::Base
  has_many :music_videos
  has_many :band_reps
end
