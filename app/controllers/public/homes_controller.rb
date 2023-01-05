class Public::HomesController < ApplicationController
  def top
    if params[:content]
      @post =  Post.where("address LIKE(?) or title LIKE(?)","%#{params[:content]}%","%#{params[:content]}%").last
      @posts = Post.where(latitude: (@post.latitude - 0.1)..(@post.latitude + 0.1),longitude: (@post.longitude - 0.1)..(@post.longitude + 0.1))
    else
      @posts = Post.all
    end


  end

  def about
  end

  def new_guest
    user= User.find_or_create_by(email: 'guest_signin328@gmail.com',name: 'hoge') do |user|
      user.password= SecureRandom.urlsafe_base64
    end
      sign_in user
      redirect_to root_path
  end

end
