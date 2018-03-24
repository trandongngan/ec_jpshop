class ProductController < ApplicationController
  def show
  end

  def search
    category = params[:slug] != 'search' ? Category.find_by(slug: params[:slug]) : nil

    category_id = category.blank? ? nil : category.id

    @products = Product.search(keyword: params[:keyword], category_id: category_id)
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
end
