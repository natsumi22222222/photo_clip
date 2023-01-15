class Admin::TagsController < ApplicationController
  def index
    @tag= Tag.new
    @tags= Tag.all
    @tags_page= Tag.all.page(params[:page]).per(10)
  end

  def create
    @tag= Tag.new(tag_params)
    @tag.save
    redirect_to request.referer
  end

  def edit
    @tag= Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to request.referer
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :post_id)
  end
end
