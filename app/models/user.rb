class User < ApplicationRecord
  after_commit :welcome_send, only: [:create]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart, dependent: :destroy
  has_one :wishlist, dependent: :destroy
  has_many :favorites, through: :wishlist, dependent: :destroy

  def welcome_send
    UserMailer.welcome_email(self).deliver
  end

 def favorite(item)
    favorites.find_or_create_by(item: item)
  end
 
  def unfavorite(item)
    favorites.where(item: item).destroy_all
    item.reload
  end

end
