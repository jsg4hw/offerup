class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.integer :category_id
      t.integer :user_id
      t.string :image
      t.string :item_location
      t.boolean :purchased

      t.timestamps
    end
  end
end
