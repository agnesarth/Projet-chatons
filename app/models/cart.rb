class Cart < ApplicationRecord
    has_one :order
    has_many :cart_items, dependent: :destroy
    has_many :items, through: :cart_items
    belongs_to :user

    def add_to_cart(item_id)
      if self.cart_items.find_by(item_id: item_id)
        flash[:error] = "Alert! Animal trafficking! No more than one cat per cart allowed"
      else
        cart_item = Item.find(item_id)
        self.items << cart_item
        self.save
      end
    end

    def total_price
        total = 0
        #Item.all.where('id = ?', CartItem.find_by(cart_id: self.id).item_id).each do |item|
        Item.where(id: self.cart_items.each.pluck(:item_id)).each do |item|
            total += item.price
        end
        return total
    end


end
