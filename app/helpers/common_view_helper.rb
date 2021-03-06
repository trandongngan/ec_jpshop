module CommonViewHelper
  def select_categories(categories)
    select_tag "categories",
               options_from_collection_for_select(@categories, "slug", "name"),
               {
                 style: "width: auto; display: block; top: 0px; float: left; margin: 10px 20px;",
                 id: "categories"
               }
  end

  def new_products
    products = Product.new_products

    tags = []
    products.each do |product|
      tags << content_tag(
        :li,
        raw("<img src=\"#{product.image_path}\" alt=\"#{product.name}\" /><h4 class=\"blue\"><a href=\"/#{product.id}/#{product.slug}\">#{product.name}</a></h4>")
      )
    end

    content_tag :ul, tags.join("").html_safe
  end

  def slider_category(parent_id)
    ids = Category.sub_categories(parent_id).pluck(:id)
    products = Product.by_category_ids(ids)

    tags = []
    products.each do |product|
      tags << content_tag(
        :li,
        raw("<a href=\"/#{product.id}/#{product.slug}\"><img src=\"#{product.image_path}\" alt=\"#{product.name}\" /></a>")
      )
    end

    content_tag :ul, tags.join("").html_safe
  end

  def second_category
    products = Product.by_category_id(5)

    tags = []
    products.each do |product|
      tags << content_tag(
        :li,
        raw("<a href=\"/#{product.id}/#{product.slug}\"><img src=\"#{product.image_path}\" alt=\"#{product.name}\" /></a>")
      )
    end

    content_tag :ul, tags.join("").html_safe
  end

  def logged_in
    current_user.blank? ? raw("<a href='/my/login' class='btnLogin'>Đăng nhập</a>") : current_user.username
  end
end
