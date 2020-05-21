class RatingsController < ApplicationController

    def new
     @game = Game.find_by_id(params[:game_id])
     @rating = @game.ratings.build
    end 

    def create
     @rating = current_user.ratings.build(rating_params)

     if @rating.save
     redirect_to rating_path(@rating)
     else
        render :new
     end 
    end

    def show
        @rating = Rating.find_by_id(params[:id])
    end 

    def index
        if params[:game_id]
            @game = Game.find_by_id(params[:game_id])
            @ratings = @game.ratings
        else
            @ratings = Rating.all
        end
    end 


    private

    def rating_params
        params.require(:rating).permit(:game_id, :content, :score)
    end
end
