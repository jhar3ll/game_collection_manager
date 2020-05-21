class GamesController < ApplicationController

    def new
     @game = Game.new 
    end 

    def create
        @game = current_user.games.build(game_params)
        @game.user_id = session[:user_id]
        if @game.save
            redirect_to game_path(@game)
        else 
            render :new
        end 

    def show 
        @game = Game.find_by_id(params[:id])
    end
 end 



private

 def game_params
    params.require(:game).permit(:title, :genre_id, :rating, :platform_id)
 end 
end 