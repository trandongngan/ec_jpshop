class SellerProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user, foreign_key: :seller_id


  DEFAULT_SELL_STATUS = 0

  OVER_SELL_STATUS = 1

  scope :offers, ->(product_id) { where('product_id = :product_id', product_id: product_id) }
  scope :not_over_sell, ->() { where('status <> :status', status: OVER_SELL_STATUS) }
end
