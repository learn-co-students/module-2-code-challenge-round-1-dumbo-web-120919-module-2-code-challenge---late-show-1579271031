class AppearancesController < ApplicationController
    before_action :find_appearance, only: [:show, :edit, :update, :destroy]

    def index
        @appearances = Appearance.all
    end
  
    def show
    end
  
    def new
        @appearance = Appearance.new

        @episodes = Episode.all
        @guests = Guest.all
    end
  
    def create
        @appearance = Appearance.create(appearance_params)

        if @appearance.valid?
            redirect_to episode_path(@appearance.episode_id)
        else
            flash[:errors] = @appearance.errors.full_messages
            redirect_to new_appearance_path 
        end 
       
    end
  
    def edit 
        @episodes = Episode.all
        @guests = Guest.all
    end
  
    def update
        @appearance.update(appearance_params)

        if @appearance.valid?
            redirect_to appearance_path(@appearance)
        else
            flash[:errors] = @appearance.errors.full_messages
            redirect_to edit_appearance_path(@appearance) 
        end 
    end
      
    def destroy
        @appearance.destroy
        
        redirect_to appearances_path
    end
  
    private
  
    def find_appearance
        @appearance = Appearance.find(params[:id])
    end
  
    def appearance_params
        params.require(:appearance).permit(:rating, :episode_id, :guest_id)
    end
  end