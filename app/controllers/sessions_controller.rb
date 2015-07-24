class SessionsController < ApplicationController
  def new
  end

  def create
    # since we've made our usernames unique, this should return only one!
    band_rep = BandRep.find_by(username: params[:username])

    if band_rep && band_rep.authenticate(params[:password])
      # store data in the session!
      session[:band_rep_id] = band_rep.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now.alert = "Invalid login credentials."
      render :new
    end
  end

  def destroy
    # clear data from the session!
    session[:band_rep_id] = nil

    redirect_to root_path, notice: "Logged out!"
  end
end
