class EpisodesController < ApplicationController
  before_action :episode_params, only: [:create, :update]

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    @guests = Guest.all
    @avg_rating = @episode.avg_rating
  end

  private

  def episode_params
    params.require(:episode).permit(:date, :number)
  end
end
