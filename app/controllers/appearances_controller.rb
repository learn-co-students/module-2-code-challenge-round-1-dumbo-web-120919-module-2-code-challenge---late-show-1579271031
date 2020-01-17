class AppearancesController < ApplicationController

    def new
        @episodes = Episode.all
        @guests = Guest.all
        @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.new(appearance_params)

        if @appearance.save
            redirect_to episode_path(@appearance.episode)
        else
            flash[:errors] = @appearance.errors.full_messages
            redirect_to new_appearance_path
        end
    end

    private
    def find_appearance
        @appearance = Appearance.find(params[:id])
    end

    def appearance_params
        params.require(:appearance).permit(:rating, :guest_id, :episode_id)
    end

end