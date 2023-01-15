class Admin::PostsController < ApplicationController

  def index
    @posts= Post.all
    @posts_page= Post.all.page(params[:page]).per(10)
  end

  def show
   @post= Post.find(params[:id])
  end

  def edit
    @post= Post.find(params[:id])
  end

  def update
    @post= Post.find(params[:id])
    @post.update(post_params)
    redirect_to edit_admin_post_path
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:latitude,:longitude ,:address, :image,:release, :genre_id)
  end
end
