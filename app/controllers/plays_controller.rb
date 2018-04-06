class PlaysController < ApplicationController
    before_action :find_play, only: [:edit, :update, :show, :destroy]
    before_action :category_options, only: [:new, :create, :edit, :update]
    
    def index
        @plays = Play.all.order("created_at DESC")
    end
    
    def new
        @play = current_user.plays.new
    end
    
    def create
        @play = current_user.plays.new(play_params)
        @play.category_id = params[:category_id]
        if @play.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        @play.category_id = params[:category_id]
        if @play.update(play_params)
            redirect_to play_path(@play)
        else
            render 'edit'
        end
    end
    
    def show
    end
    
    def destroy
        @play.destroy
        redirect_to root_path
    end
    
    private
    
    def find_play
        @play = Play.find(params[:id])
    end
    
    def play_params
        params.require(:play).permit(:title, :description, :director, :category_id)
    end

    def category_options
        @categories = Category.all.map { |c| [c.name, c.id] }
    end
end
