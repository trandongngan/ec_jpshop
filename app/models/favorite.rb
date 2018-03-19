class Favorite < ApplicationRecord
  validates :product_id, presence: true
  validates :user_id, presence: true

  belongs_to :product
end
