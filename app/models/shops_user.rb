class ShopsUser < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :shop, uniqueness: { scope: :user }
end
