class Cart < ApplicationRecord
  validates :user_id, presence: true
  validates :seller_id, presence: true

  belongs_to :user
end
