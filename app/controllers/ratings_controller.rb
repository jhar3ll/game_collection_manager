class RatingsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @ratings = Rating.ordered_by_create
    end 

    def new
        @game = Game.find_by_id(params[:game_id])
        @rating = @game.ratings.build
        @user = User.find_by_id(params[:user_id])
    end 

    def create
        @rating = current_user.ratings.build(rating_params)

        if @rating.save
            redirect_to user_path(current_user)
        else
            render :new
        end 
    end

    def show
        if @user = User.find_by_id(params[:id])
            @ratings = @user.ratings
        else 
            @ratings = Rating.ordered_by_create 
        end
    end 

    def edit
        @rating = Rating.find_by_id(params[:id])
    end

    def update
        @rating = Rating.find_by_id(params[:id])
        @rating.update(params.require(:rating).permit(:game_id, :user_id, :content, :score))
        redirect_to user_path(current_user)
    end 

    def destroy
        @rating = Rating.find(params[:id])
        @rating.destroy
        redirect_to user_path(current_user)
    end

    def five_star_rating
        @ratings = Rating.five_star_rating
    end 

    private

    def rating_params
        params.require(:rating).permit(:game_id, :user_id, :content, :score)
    end
end
