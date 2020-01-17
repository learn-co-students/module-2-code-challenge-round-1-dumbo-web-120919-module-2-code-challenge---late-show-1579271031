class AppearancesController < ActionController::Base
    def index
        @appearances = Appearance.all
      end
    
    def new
        @appearance = Appearance.new
        @guests = Guest.all
        @episodes = Episode.all
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

    def destroy
        @appearance = Appearance.find(params[:id])
        @appearance.destroy
        redirect_to guest_path(@appearance.guest_id)
    end

    private

    def appearance_params
        params.require(:appearance).permit(:guest_id,:episode_id, :rating)
    end
end