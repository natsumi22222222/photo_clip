class Admin::PostsController < ApplicationController
  def index
   @posts= Post.all
   @posts_page= Post.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end
end
