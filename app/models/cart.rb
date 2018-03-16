class Cart < ApplicationRecord
  validates :user_id, presence: true
  validates :product_id, presence: true

  has_one :user_id
end
