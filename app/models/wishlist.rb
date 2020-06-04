class Wishlist < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :items, through: :favorites
  belongs_to :user
end
