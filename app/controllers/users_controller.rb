class UsersController < ApplicationController
  
  def index
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    # if @user.valid?
    if user.save
      # Logs you in with the correct password
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :signup
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
