class Public::UsersController < ApplicationController


  def show
    @user= User.find(params[:id])
  end

  def edit
    @user= User.find(params[:id])
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
