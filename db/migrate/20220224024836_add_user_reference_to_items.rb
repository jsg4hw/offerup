class AddUserReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :users
    add_index :items, :user_id
    change_column_null :items, :user_id, false
  end
end
