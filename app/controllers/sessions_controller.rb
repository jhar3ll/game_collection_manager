class SessionsController < ApplicationController

    def index
    end 

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end 

    def create 
        if params[:provider] == 'facebook'
            @user = User.create_by_facebook_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
        @user = User.find_by(username: params[:user][:username])
     
            if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
            else 
            flash[:error] = "Login info incorrect. Please try again!"
            redirect_to login_path
        end 
      end 
    end 

    def omniauth
        @user = User.create_by_facebook_omniauth(auth)

            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end 

    private 

    def auth 
        request.env['omniauth.auth']
    end 
end
