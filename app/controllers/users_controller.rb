class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = User.find_by_username(params[:username])
      authenticated_user = user.authenticate(params[:password]) if user
      session[:user_id] = authenticated_user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.permit(:username, :password, :password_confirmation, :remote_image_url)
  end
end