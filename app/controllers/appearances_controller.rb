class AppearancesController < ApplicationController
    before_action :appearance_params, only: [:create]

    def index
    end
    
    def new
        @appearance = Appearance.new
        @guests = Guest.all
        @episodes = Episode.all
    end

    def show
        @appearance = Appearance.find(params[:id])
    end

    def create
        @appearance = Appearance.create(appearance_params)

        if @appearance.valid?
            @episode = Episode.find(@appearance.episode_id)
            redirect_to episode_path(@episode)
        else
            flash[:errors] = @appearance.errors.full_messages
            redirect_to new_appearance_path
        end
    end

    private

    def appearance_params
        params.require(:appearance).permit(:guest_id, :episode_id, :rating)
    end

end
