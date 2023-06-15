class Story < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  scope :active, -> { where('expires_at > ?', Time.now) }
  scope :expired, -> { where('expires_at <= ?', Time.now) }
end
