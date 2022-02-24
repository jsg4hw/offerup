class AddItemLocationLatitudeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_location_latitude, :float
  end
end
