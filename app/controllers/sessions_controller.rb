class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(name: user_params[:name])
        if @user and !!@user.authenticate(user_params[:password])
            session[:user_id] = @user.id
        else
            redirect_to root_path
        end
    end



end
