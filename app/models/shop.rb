class Shop < ApplicationRecord
    has_many :shops_users, dependent: :destroy
	has_many :users, through: :shops_users
	has_many :listings, dependent: :destroy
	validates_presence_of :name, :description
end
