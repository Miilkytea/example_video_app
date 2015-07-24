class BandRepsController < ApplicationController
  def new
    @band_rep = BandRep.new
  end

  def create
    @band_rep = BandRep.new(band_rep_params)
    if @band_rep.save
      # log in: store data in the session!
      session[:band_rep_id] = band_rep.id
      
      # notice adds a welcome message to the *flash*!
      redirect_to root_path, notice: "Welcome new user."
    else
      render :new
    end
  end

private

  def band_rep_params
    params.require(:band_rep).permit(
      :username, 
      :password, 
      :password_confirmation, 
      :band_id
    )
  end
end
