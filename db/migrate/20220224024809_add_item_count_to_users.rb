class AddItemCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :items_count, :integer
  end
end
