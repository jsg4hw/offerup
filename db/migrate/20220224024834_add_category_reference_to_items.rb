class AddCategoryReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :categories
    add_index :items, :category_id
    change_column_null :items, :category_id, false
  end
end
