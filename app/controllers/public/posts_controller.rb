class Public::PostsController < ApplicationController
  def new
    @post= Post.new
  end

  def create
     @post= Post.new(post_params)
  end

  def index

  end

  def show
    @post= find(params[:id])
    @posts= @user.posts
  end

  def exif
    @post= find(params[:id])
    @posts= @user.posts
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:lat,:lng,:image)
  end
end
