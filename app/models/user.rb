class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image
  has_many :posts
  has_many :comments
  has_many :likes
 
  after_save_commit :welcome_send

  def welcome_send
    if self.confirmed?
       UserMailer.welcome_email(self).deliver_later
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    super + ['username']
  end



end