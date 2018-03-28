class ProductController < ApplicationController
  before_action :set_product, only: [:show, :offer_list]

  def show
  end

  def search
    category = params[:slug] != 'search' ? Category.find_by(slug: params[:slug]) : nil

    ids = category.blank? ? nil : (category.parent_id.blank? ? Category.sub_categories(category.id).pluck(:id) : [category.id])

    @products = Product.search(keyword: params[:keyword], ids: ids)
  end

  def offer_list
    @offers = SellerProduct.offers(params[:product_id]).not_over_sell
  end

  def add_to_cart
    seller_product = SellerProduct.find_by(id: params[:seller_id])

    Cart.create!({
      seller_id: seller_product.id,
      user_id: current_user.id,
      amount: 1
    })
    render json: {}
  end

  def add_to_favorite
    Favorite.create!({
      product_id: params[:product_id],
      user_id: current_user.id,
    })
    render json: {}
  end

  private
  def set_product
    @product = Product.includes(:images).find_by(id: params[:product_id])
  end
end
