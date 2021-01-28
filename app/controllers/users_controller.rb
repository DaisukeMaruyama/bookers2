class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  	@book = Book.new
  	@books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user = User.update(user_params)
    @user.save
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
