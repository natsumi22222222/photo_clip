class Admin::PostsController < ApplicationController
  def index
   @posts= Post.all
   @posts_page= Post.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
    @post= Post.find(params[:id])
  end

  def update
     @post= Post.find(params[:id])
     @post.update
     redirect_to request.referer
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end
end
