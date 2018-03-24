module Searchable
  extend ActiveSupport::Concern

  # include Constant

  class_methods do
    ##
    # search by category, sub-category or product
    ##
    def search(keyword: nil, category_id: nil)
      # temporary: implement searching directly database
      # future: build searching server (solr or elasticsearch)

      return [] if keyword.blank? && category_id.blank?

      return Product.by_category_id(category_id) unless category_id.blank?

      Product.by_keyword(keyword)
    end
  end
end
