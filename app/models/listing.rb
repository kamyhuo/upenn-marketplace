class Listing < ApplicationRecord
  belongs_to :shop
  validates_presence_of :state, :title, :price, :description, :state, :image
  mount_uploader :image, ImageUploader

end
