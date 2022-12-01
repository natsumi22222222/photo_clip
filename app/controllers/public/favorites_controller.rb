class Public::FavoritesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @favorite = current_favorites.new(post_id: post.id)
      @favorite.save
      redirect_to post_path
    end
  
    def destroy
      @post = Post.find(params[:post_id])
      @favorite = current_favorites.find_by(post_id: post.id)
      @favorite.destroy
      redirect_to post_path
    end
end
