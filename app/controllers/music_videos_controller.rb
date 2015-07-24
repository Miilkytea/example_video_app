class MusicVideosController < ApplicationController
  def new
    # since we are nested, we can just get the band id
    # from the params
    @band = Band.find(params[:id])
    @music_video = MusicVideo.new
  end

  def create
    # since we are nested, we can just get the band id
    # from the params
    @band = Band.find(params[:id])
    music_video = MusicVideo.new(music_video_params)
    @band.music_videos << music_video

    if music_video.save
      redirect_to band_path(@band), notice: "Video added!"
    else
      render :new
    end
  end

private

  def music_video_params
    params.require(:music_video).permit(
      :title, 
      :video_embed_uri
    )
  end
end
