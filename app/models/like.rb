class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.like(user, post)
    
    create(user: user, post: post)
  end

  def self.unlike(user, post)
    like = find_by(user: user, post: post)
    like.destroy if like
  end
  def likes?(post)
    
    likes.exists?(post_id: post.id)
  end
end
