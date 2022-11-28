class Public::GenresController < ApplicationController
  def index
    @genres= Genre.all
  end

  def edit
  end
end
