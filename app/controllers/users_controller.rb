class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            binding.pry
            render :new
        end 
    end 

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
        @ratings = current_user.ratings.ordered_by_score
    end 

private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
end 