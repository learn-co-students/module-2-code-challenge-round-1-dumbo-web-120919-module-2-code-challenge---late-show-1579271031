class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all

    render :index
  end

  def show
    @episode = Episode.find(params[:id])
    @guests = @episode.guests
    

    render :show
  end
end
