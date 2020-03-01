class SessionsController < ApplicationController

    def new
    end 

    def create 
        @user = User.find_by(name: params[:user][:password])
        if @user && user.authenticate(params[:user][:password])
            session[:user_id] = @user_id
            redirect_to '/'
        else
            redirect_to :login
        end
        
    end

    def destroy 
    end 
