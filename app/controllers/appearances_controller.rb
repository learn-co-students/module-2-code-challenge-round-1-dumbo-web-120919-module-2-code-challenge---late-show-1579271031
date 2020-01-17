class AppearancesController < ApplicationController
  #Create
  def new
    @guests = Guest.all
    @episodes = Episode.all
    @appearance = Appearance.new

    render :new
  end

  def create
    appearance = Appearance.create(appearance_params)
    episode = appearance.episode_id

    if appearance.valid?
      redirect_to episode_path(episode)
    else
      flash[:errors] = appearance.errors.full_messages

      redirect_to new_appearance_path
    end
  end

  private

  #Strong Params

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end
  end
  