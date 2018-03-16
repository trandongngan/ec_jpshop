require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get product_show_url
    assert_response :success
  end

  test "should get search" do
    get product_search_url
    assert_response :success
  end

end
