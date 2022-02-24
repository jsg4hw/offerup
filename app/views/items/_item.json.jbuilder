json.extract! item, :id, :title, :price, :category_id, :user_id, :image,
              :item_location, :purchased, :created_at, :updated_at
json.url item_url(item, format: :json)
