class UsersController < ApplicationController

    def new

    end

    def create
        @user = User.create(user_params)
        if @user.password == params[:user][:password_confirmation]
            session[:user_id] = @user.id
        else
            redirect_to new_user_path
        end
    end

    def show

    end
    
end