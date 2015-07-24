class MusicVideosController < ApplicationController
  before_action :authenticate # do it for all!
  before_action :authorize    # do it for all!

  def new
    # @band was created in the authorize method!
    @music_video = MusicVideo.new
  end

  def create
    # @band was created in the authorize method!
    music_video = MusicVideo.new(music_video_params)
    @band.music_videos << music_video

    if music_video.save
      redirect_to band_path(@band), notice: "Video added!"
    else
      render :new
    end
  end

private

  def authenticate
    unless logged_in?
      flash.now.alert = 
        "You must be logged in to access this section of the site."
      redirect_to login_path
    end
  end

  def authorize
    # since we are nested, we can just get the band id
    # from the params
    @band = Band.find(params[:band_id])

    unless current_user.band == @band
      flash.now.alert = 
        "You are not authorized to edit this band's information."
      redirect_to band_path(@band)
    end
  end

  def music_video_params
    params.require(:music_video).permit(
      :title, 
      :video_embed_uri
    )
  end
end
