class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :picture
  has_many :likes

  after_save :post_send
   
  def post_send
    PostMailer.new_post(self).deliver_later
  end
  
end
