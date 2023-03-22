class Public::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user= User.find(params[:id])
  end

  def edit
    @user= User.find(params[:id])
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "他ユーザーのプロフィールは編集できません"
      redirect_to @user
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(posts_path) unless @user == current_user
  end

end
