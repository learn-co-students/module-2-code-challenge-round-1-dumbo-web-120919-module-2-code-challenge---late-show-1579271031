class AppearancesController < ApplicationController

    def new
        @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.create(strong_params)
        if @appearance.valid?
        redirect_to @appearance
        else
            flash[:error] = @appearance.errors.full_messages
            redirect_to new_appearance_path
        end
    end

    def show
        @appearance = Appearance.find(params[:id])
    end

    private


    def strong_params
        params.require(:appearance).permit(:guest_id, :episode_id, :rating)
    end
end
