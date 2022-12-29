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

  def sky
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def night_view
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def architecture
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def vehicle
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

  def fashion
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def military
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def portrait
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def wedding
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

  def meal
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def art
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def bw
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end

  def other
    if params[:genre_id].present?
      @posts= Post.where(genre_id: params[:genre_id])
    else
      @posts= Post.all
    end
  end


end
