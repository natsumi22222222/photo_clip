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

  def user_post
     @posts= Post.where(user_id: params[:user_id])
  end

  def search
    if params[:keywords].present?
      @keywords= params[:keywords].split(/[[:blank:]]+/)
      @type= params[:type]
      @results= Post.none
      if @type == 'AND'
        @keywords.each_with_index do |keyword, i|
          @results= Post.search(keyword) if i == 0
          @results= @results.merge(@results.search(keyword))
        end
      else
        @keywords.each do |keyword|
          @results= @results.or(Post.search(keyword))
        end
      end
    end
    # if params[:tag_ids].present?
    #   @results= Post.none
    #   params[:tag_ids].each do |key, value|
    #     @posts += Tag.find_by(name: key).posts if value == "1"
    #   end
    # @post.distinct!
    # end
  end

  def show
    @post= Post.find(params[:id])
    @comment= Comment.new
    if params[:tag_ids]
      @posts= []
      params[tag_ids].each do |key, value|
        @posts += Tag.find_by(name: key).posts if value == "1"
      end
    end
    if params[:tag_ids]
      @posts= []
      params[:tag_ids].each do |key, value|
        if value == "1"
          post_tags= Tag.find_by(name: key).posts
          @posts= @posts.empty? ? post_tags : @posts & post_tags
        end
      end
    end
  end


  def exif
    @post= Post.find(params[:id])
  end

  def map
    if params[:content]
      @post=  Post.where("address LIKE(?) or title LIKE(?)","%#{params[:content]}%","%#{params[:content]}%").last
      @posts= Post.where(latitude: (@post.latitude - 0.1)..(@post.latitude + 0.1),longitude: (@post.longitude - 0.1)..(@post.longitude + 0.1))
    else
      @posts= Post.all
    end
  end


  private


  def post_params
    params.require(:post).permit(:title,:body,:latitude,:longitude ,:address, :image,:release, :genre_id)
  end
end
