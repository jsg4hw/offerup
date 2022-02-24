class AddItemLocationFormattedAddressToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_location_formatted_address, :string
  end
end
