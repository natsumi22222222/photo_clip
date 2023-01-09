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
       flash[:notice]= '投稿が完了しました！'
      @post.tags_save(tag_list)
      redirect_to posts_path
    else
      render:new
    end
  end

  def index
    @posts= Post.where(release:1).order(id: "DESC")
    @posts_page= Post.all.page(params[:page]).per(15)
  end

  def show
    @post= Post.find(params[:id])
    @comment= Comment.new
  end


  def exif
    @post= Post.find(params[:id])
  end

  def map
    if params[:content]
      @post =  Post.where("address LIKE(?) or title LIKE(?)","%#{params[:content]}%","%#{params[:content]}%").last
      @posts = Post.where(latitude: (@post.latitude - 0.1)..(@post.latitude + 0.1),longitude: (@post.longitude - 0.1)..(@post.longitude + 0.1))
    else
      @posts = Post.all
    end

  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:latitude,:longitude ,:address, :image,:release, :genre_id)
  end
end
