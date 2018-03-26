class ProductController < ApplicationController
  before_action :set_product, only: [:show, :offer_list]

  def show
  end

  def search
    category = params[:slug] != 'search' ? Category.find_by(slug: params[:slug]) : nil

    category_id = category.blank? ? nil : category.id

    @products = Product.search(keyword: params[:keyword], category_id: category_id)
  end

  def offer_list
    @offers = SellerProduct.offers(params[:product_id]).not_over_sell
  end

  def add_to_cart
    # product = Product.find_by(id: params[:product_id])
    Cart.create!(params)
    render json: {}
  end

  def add_to_favorite
    Favorite.create!(params)
    render json: {}
  end

  private
  def set_product
    @product = Product.find_by(id: params[:product_id])
  end
end
