class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    has_many :items, through: :order_items

    def add_to_order(item_id)
        if self.order_items.find_by(item_id: item_id)
          return
        else
          order_item = Item.find(item_id)
          self.items << order_item
          self.save
        end
    end
  
    def total_price
        total = 0
        Item.where(id: self.order_items.each.pluck(:item_id)).each do |item|
            total += item.price
        end
        return total
    end



end
