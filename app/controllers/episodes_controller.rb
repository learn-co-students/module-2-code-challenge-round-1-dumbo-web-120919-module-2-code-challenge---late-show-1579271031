class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    find_episode
  end


  private

  def find_episode
    @episode = Episode.find(params[:id])
  end
  
end
