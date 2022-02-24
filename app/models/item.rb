require 'open-uri'
class Item < ApplicationRecord
  before_validation :geocode_item_location

  def geocode_item_location
    if self.item_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.item_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.item_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.item_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.item_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_base64_uploader :image, ImageUploader

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
