class ShopsUser < ApplicationRecord
  belongs_to :user
  belongs_to :shop, dependent: :destroy
  validates :shop, uniqueness: { scope: :user }
end
