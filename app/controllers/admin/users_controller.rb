class Admin::UsersController < ApplicationController
  def index
    @users= User.all
    @users_page= User.all.page(params[:page]).per(10)
  end

  def show
    @user= User.find(params[:id])
  end

  def edit
  end
end
