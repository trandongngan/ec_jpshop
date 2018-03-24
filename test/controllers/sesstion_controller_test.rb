require 'test_helper'

class SesstionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sesstion_create_url
    assert_response :success
  end

end
