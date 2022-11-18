class Public::HomesController < ApplicationController
  def top

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
