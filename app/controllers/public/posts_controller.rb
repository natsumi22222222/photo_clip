class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post= Post.new
  end

  def create
    @post= Post.new(post_params)
    @post.user_id = current_user.id
    tag_list= params[:post][:name].split(',')
    if @post.save!
      @post.tags_save(tag_list)
      redirect_to posts_path
    else
      render:new
    end
  end

  def index
    @posts= Post.where(release:1).order(id: "DESC")
  end

  def show
    @post= Post.find(params[:id])
    @comment= Comment.new
  end

  def exif
    @post= find(params[:id])
    @posts= @user.posts
    @comment= Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:latitude,:longitude ,:address, :image,:release, :genre_id)
  end
end
