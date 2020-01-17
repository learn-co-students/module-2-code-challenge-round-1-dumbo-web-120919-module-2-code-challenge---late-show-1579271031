class GuestsController < ApplicationController

  #Read
  def index
    @guests = Guest.all

    render :index
  end

  def show
    @guest = Guest.find(params[:id])

    #Sort episodes by highest rating
    @sorted_episodes = @guest.sort_episodes_by_rating
    
    render :show
  end

  

end
