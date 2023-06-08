class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image

  after_save_commit :welcome_send

  def welcome_send
  UserMailer.welcome_email(self).deliver_later
  end
end
