class AppearancesController < ApplicationController
    before_action :find_appearance, only: [:show, :create, :destroy]

    def index
        @appearances = Appearance.all
    end

    def show
        # @appearance = Appearance.find(params[:id])
    end

    def new
        @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.create(appearance_params)

        if @appearance.valid?
            redirect_to appearance_path(@appearance)
        else 
            flash[:rating_errors] 
            redirect_to new_appearance_path
        end

    end 


    private

    def rating_errors
        flash[:errors] = @ppearance.errors.full_messages
    end

    def appearance_params
        params.require(:appearance).permit(:guest_id, :episode_id, :rating)
    end

    def find_appearance
        @appearance = Appearance.find(params[:id])
    end

end
