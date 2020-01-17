class EpisodesController < ApplicationController
  before_action :find_episode, only: [:show, :edit, :update, :destroy]

  def index
    @episodes = Episode.all
  end

  def show
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.create(episode_params)

    redirect_to episode_path(@episode)
  end

  def edit 
  end

  def update
    @episode.update(episode_params)

    redirect_to episode_path(@episode)
  end
    
  def destroy
    @episode.destroy
    
    redirect_to episodes_path
  end

  private

  def find_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:date, :number)
  end
end
