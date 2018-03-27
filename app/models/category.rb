class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true

  has_many :products

  scope :not_subcategory, -> { where(parent_id: nil) }

  scope :sub_categories, -> (parent_id) { where("parent_id = :parent_id", parent_id: parent_id) }

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:vietnamese]
  end
end
