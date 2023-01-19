class Admin::CommentsController < ApplicationController

  def index
    @comments= Comment.all
    @comments_page= Comment.all.page(params[:page]).per(10)
  end

  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

end
