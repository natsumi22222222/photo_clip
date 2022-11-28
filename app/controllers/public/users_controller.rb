class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user= current_user
  end

  def edit
    @user= current_user
  end

  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
      redirect_to my_page_path(@user.id)
    else
      render :edit
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
