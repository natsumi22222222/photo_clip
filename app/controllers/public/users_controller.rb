class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user= User.find(params[:id])

  end

  def edit
    @user= User.find(params[:id])
     flash[:notice]= 'プロフィールを編集しました'
  end

  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :profile_image)
  end

end
