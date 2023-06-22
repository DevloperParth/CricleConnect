class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :stories
  after_save_commit :welcome_send
  enum role: [:user,:admin]

  followability
  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def block(user)
    followerable_relationships.where(followable_id: user.id).blocked
  end

  def already_likes?(post)
    self.likes.where(post_id: post.id).exists?
  end

  def welcome_send
    if self.confirmed?
       UserMailer.welcome_email(self).deliver_later
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    super + ['username']
  end
  
end