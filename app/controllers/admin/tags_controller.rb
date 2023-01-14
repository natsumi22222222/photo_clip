class Admin::TagsController < ApplicationController
  def index
    @tags= Post.all
    @tags_page= Tag.all.page(params[:page]).per(10)
  end

  def edit
  end
end
