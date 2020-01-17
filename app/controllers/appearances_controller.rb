class AppearancesController < ApplicationController

    def show
        @appearance = Appearance.find(params[:id])
    end

    def new
        @appearance = Appearance.new
        @guests = Guest.all
        @episodes = Episode.all
    end

    def create
        @appearance = Appearance.create(appearance_params)

        # if @appearance.save
        redirect_to episode_path(@episode)

        # else
        # flash[:some_errors] = @appearance.errors.full_message
        # redirect_to new_appearance_path
        # end
    end

    private

    def appearance_params
        params.require(:appearance).permit(:guest_id, :episode_id, :rating)
    end
end
