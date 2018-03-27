class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  include Searchable

  NEW_PRODUCT_LIMIT = 5

  validates :name, presence: true
  validates :category_id, presence: true

  has_many :product_images

  has_many :images, through: :product_images

  has_many :product_properties
  has_many :favorites

  belongs_to :category

  scope :by_category_ids, ->(ids) { where("category_id IN (:ids)", ids: ids.join(", ")) }

  scope :by_category_id, ->(category_id) { where('category_id = :category_id', category_id: category_id) }

  scope :by_keyword, ->(keyword) { where("name LIKE ? OR description LIKE ? ", "%#{keyword}%", "%#{keyword}%") }

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:vietnamese]
  end

  def self.new_products(limit: NEW_PRODUCT_LIMIT)
    self.order(id: :desc).limit(limit)
  end

  def image_path
    images.first.path
  end
end
