class GamesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @games = Game.search(params[:search])
     end 
    
    def new
        @game = Game.new 
    end 

    def create
        @game = current_user.games.build(game_params)
        @game.user_id = session[:user_id]

        if @game.save
            redirect_to games_path
        else 
            render :new
        end 
    end 

    def show 
        @game = Game.find_by_id(params[:id])
    end

    def edit
        @game = Game.find_by_id(params[:id])
    end 

private

 def game_params
    params.require(:game).permit(:title, :genre_id, :rating, :platform_id)
 end 
end 