class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show 
    @episode = Episode.find(params[:id])
    redirect_to episode_path(@episode)
  end
end
