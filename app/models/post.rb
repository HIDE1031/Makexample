class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true
  validates :description, presence: true
  
  belongs_to :user
end
