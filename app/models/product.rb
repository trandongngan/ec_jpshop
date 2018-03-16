class Product < ApplicationRecord
  include Searchable

  validates :name, presence: true
  validates :category_id, presence: true

  has_many :image
  has_many :product_properties

  belongs_to :category

  scope :by_category_id, ->(category_id) { where('category_id = :category_id', category_id: category_id) }

  scope :by_keyword, ->(keyword) { where("name like '%:category_id%' OR description like '%keyword%'", keyword: keyword) }
end
