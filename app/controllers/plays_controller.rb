class PlaysController < ApplicationController
    before_action :find_play, only:[:edit, :update, :show, :destroy]
    
    def index
    end
    
    def new
        @play = Play.new
    end
    
    def create
        @play = Play.new(play_params)
        if @play.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def show
    end
    
    def destroy
    end
    
    private
    
    def find_play
        @play = Play.find(params[:id])
    end
    
    def play_params
        params.require(:play).permit(:title, :description, :director)
    end
end
