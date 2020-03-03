class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    # rejects invalid passwords
    # rejects empty passwords
    if user && user.authenticate(params[:user][:password])
    # logs you in with the correct password
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :login  
    end
  end

  def destroy
    session.clear if session[:user_id]
    redirect_to :login
  end
end
