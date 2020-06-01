class Cart < ApplicationRecord
    has_one :order
    has_many :cart_items, dependent: :destroy
    has_many :items, through: :cart_items
    belongs_to :user


    def price_total
        added_total = 0
        Items.where(Items.cart_items_id == this.cart_items_id).each do |item|
            added_total += item.price
        end
        return added_total
    end


end
