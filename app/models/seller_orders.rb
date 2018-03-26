class SellerOrders < ApplicationRecord
  validates :seller_id, presence: true
  validates :product_id, presence: true

end
