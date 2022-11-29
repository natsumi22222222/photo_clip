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
end
