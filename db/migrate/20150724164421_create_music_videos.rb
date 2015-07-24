class CreateMusicVideos < ActiveRecord::Migration
  def change
    create_table :music_videos do |t|
      t.string :title
      t.string :video_embed_uri

      t.timestamps null: false
    end
  end
end
