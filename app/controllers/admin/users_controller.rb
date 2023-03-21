class Admin::UsersController < ApplicationController
  before_action :ensure_current_user,{only:[:show, :edit, :update]}

  def index
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

  def ensure_current_user
    @user= User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
    end
  end

end
