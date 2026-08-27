require "test_helper"

class Admin::TheatersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_theaters_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_theaters_show_url
    assert_response :success
  end
end
