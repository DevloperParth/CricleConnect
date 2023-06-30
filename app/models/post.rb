class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :picture
  has_many :likes

  def self.ransackable_attributes(auth_object = nil)
    super + ['username']
  end
end
