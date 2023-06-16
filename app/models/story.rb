class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :image

 

  scope :active, -> { where('expires_at > ?', Time.now) }
  scope :expired, -> { where('expires_at <= ?', Time.now) }
end
