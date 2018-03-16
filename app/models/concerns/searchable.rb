module Searchable
  extend ActiveSupport::Concern

  include Constant
  ##
  # search by category, sub-category or product
  ##
  def self.search(keyword, type, category_id: nil)
    # temporary: implement searching directly database
    # future: build searching server (solr or elasticsearch)

    return [] if keyword.blank? && category_id.blank?

    case type
    when Constant::SEARCH_CATEGORY_TYPE
      Product.by_category_id(category_id)
    else
      Product.by_keyword(keyword)
    end
  end
end
