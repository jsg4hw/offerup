class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :price, :float
  attribute :category_id, :integer
  attribute :user_id, :integer
  attribute :image, :string
  attribute :item_location, :string
  attribute :purchased, :boolean

  # Direct associations

  # Indirect associations

end
