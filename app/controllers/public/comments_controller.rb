class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    if comment.save
      redirect_to post_path(@post),notice: "コメントを投稿しました"
    else
      render "show"
    end
  end

  def destroy
    Comment.find_by(params[:id]).destroy
    redirect_to post_comment_path([:post_id]),alert: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
