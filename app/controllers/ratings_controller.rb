class RatingsController < ApplicationController

    def new
     @game = Game.find_by_id(params[:game_id])
     @rating = @game.ratings.build
    end 

    def index
    end 
end
