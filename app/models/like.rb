class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, uniqueness: {scope: :post_id}

  def self.like(user, post)
    create(user: user, post: post)
  end
end
