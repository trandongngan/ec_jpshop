module Searchable
  extend ActiveSupport::Concern

  # include Constant

  class_methods do
    ##
    # search by category, sub-category or product
    ##
    def search(keyword: nil, ids: [])
      # temporary: implement searching directly database
      # future: build searching server (solr or elasticsearch)

      return [] if keyword.blank? && ids.blank?

      return Product.by_category_ids(ids) unless ids.blank?

      Product.by_keyword(keyword)
    end
  end
end
