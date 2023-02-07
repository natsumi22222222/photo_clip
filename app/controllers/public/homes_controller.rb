class Public::HomesController < ApplicationController
  def top
    if params[:content]
      @post =  Post.where("address LIKE(?) or title LIKE(?)","%#{params[:content]}%","%#{params[:content]}%").last
      if @post.present?
        @posts = Post.where(latitude: (@post.latitude - 0.1)..(@post.latitude + 0.1),longitude: (@post.longitude - 0.1)..(@post.longitude + 0.1))
      else
        @posts = Post.all
      end
    else
      @posts = Post.all
    end
  end

  def about
  end

end
