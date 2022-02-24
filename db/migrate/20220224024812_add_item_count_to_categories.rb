class AddItemCountToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :items_count, :integer
  end
end
