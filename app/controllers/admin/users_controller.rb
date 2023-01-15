class Admin::UsersController < ApplicationController
  def index
    @users= User.all
    @users_page= User.all.page(params[:page]).per(10)
  end

  def show
    @user= User.find(params[:id])
  end

  def edit
    @user= User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    @user.update(user_params)
    redirect_to request.referer
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :introduction)
  end
end
