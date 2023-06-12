class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :picture
  has_many :likes

  
end
