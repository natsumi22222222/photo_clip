class Public::GenresController < ApplicationController
  def index
    @genres= Genre.all
  end

  def edit
    @genre= Genre.find(params[:id])
  end

  def update
    @genre= Genre.find(params[:id])
    @genre.update
  end

  def nature
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end

  end

  def sports
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end

  end

  def animal
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end

  end
end
