class AppearancesController < ApplicationController

    def index
        @appearances=Appearance.all
    end

    def show
    @appearance=Appearance.find(params[:id])
    end

    def new
    @appearance=Appearance.new
    @guests=Guest.all
    @episodes=Episode.all
    end

    def create
        @appearance=Appearance.create(appearance_params)
        if @appearance.valid?
            redirect_to episode_path(episode)
        else
        flash[:errors] =@appearance.errors.full_messages
        redirect_to_ new_appearance.path
          end
    end
    
    private
    
    def appearance_params
        params.require(:appearance).permit(:rating, :guest_id, :episode_id)
    end



end
