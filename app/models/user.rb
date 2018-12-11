class User < ApplicationRecord
  include BCrypt
  has_many :shops_users, dependent: :destroy
  has_many :shops, through: :shops_users, dependent: :destroy
  has_many :sales, class_name: 'Order', foreign_key: 'seller_id'
  has_many :purchases, class_name: 'Order', foreign_key: 'buyer_id'
  validates_presence_of :username, :email
    validates_uniqueness_of :username, :email

  def before_destroy
    self.shops_user.destroy_all
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
