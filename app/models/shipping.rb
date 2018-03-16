class Shipping < ApplicationRecord
  validates :order_id, presence: true
  validates :address_id, presence: true

  
end
