class Item < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
