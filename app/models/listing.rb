class Listing < ApplicationRecord
  belongs_to :shop
  has_many :orders
  self.primary_key = 'shop_id'
  validates_presence_of :state, :title, :price, :description, :state
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
