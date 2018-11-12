class Listing < ApplicationRecord
  belongs_to :shop
  validates_presence_of :state, :title, :price, :description
  mount_uploader :image, ImageUploader
end
