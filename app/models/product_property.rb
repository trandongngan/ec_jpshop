class ProductProperty < ApplicationRecord
  validates :product_id, presence: true
  validates :property_id, presence: true

  has_one :product
  has_one :property
end
