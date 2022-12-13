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
    # if params[:genre_id].present?
    #   @genre= Genre.find(params[1])
    #   @posts= post.genre_id
    # end
    @genre = Genre.find(genre_id: 1)
  end
end
