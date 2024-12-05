class AppearancesController < ApplicationController
    before_action :find_appearance,  only:[:show]

    def show
        find_appearance
    end

    def new
    @appearance = Appearance.new
    @guests = Guest.all  
    @episodes = Episode.all
    
    redirect_to create
    end

    def create
        n = Appearance.create(appearance_params)
        n
        # byebug
        redirect_to appearance_path(n.id)
    end

    private

    def appearance_params
        params.require(:appearance).permit(:guest_id , :episode_id, :rating)
    end

    def find_appearance
        @appearance = Appearance.find(params[:id])
    end


end
