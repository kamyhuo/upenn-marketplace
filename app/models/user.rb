class User < ApplicationRecord
	include BCrypt
	has_many :shops_users, dependent: :destroy
	has_many :shops, through: :shops_users
	validates_presence_of :username, :email
  	validates_uniqueness_of :username, :email

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
