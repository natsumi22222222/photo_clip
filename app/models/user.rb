class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image

  def self.guest
    find_or_create_by!(email: 'guest_signin328@gmail.com',name: 'guestuser') do |user|
      user.password= SecureRandom.urlsafe_base64
      user.name= "guestuser"
    end
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
      image
  end

  def ensure_guest_user
    @user= User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: 'ゲストユーザーは編集画面へ遷移できません。'
    end
  end
end
