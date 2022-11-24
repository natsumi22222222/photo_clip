class Public::PostsController < ApplicationController
  def new
    @post= Post.new
  end

  def create
    @post= Post.new(post_params)
    @post.user_id= current_user.id
    tag_list=params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path(@post)
    else
      render:new
    end
  end

  def index
    @tags= Tag.all
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
