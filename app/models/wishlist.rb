class Wishlist < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :items, through: :favorites
  belongs_to :user

  def add_to_wishlist(item_id)
    if self.favorites.find_by(item_id: item_id)
      return
    else
      wishlist_item = Item.find(item_id)
      self.items << favorites
      self.save
    end
  end
end
