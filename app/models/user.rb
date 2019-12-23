class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 14}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true
  
  has_secure_password
  
  has_many :posts
end
