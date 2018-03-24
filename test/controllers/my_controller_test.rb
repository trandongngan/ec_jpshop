require 'test_helper'

class MyControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get my_login_url
    assert_response :success
  end

  test "should get register" do
    get my_register_url
    assert_response :success
  end

end
