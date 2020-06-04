class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.belongs_to :wishlist, index: true
      t.belongs_to :item, index: true
      t.timestamps
    end
  end
end
