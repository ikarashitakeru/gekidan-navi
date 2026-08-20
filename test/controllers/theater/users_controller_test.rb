require "test_helper"

class Theater::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theater_users_index_url
    assert_response :success
  end

  test "should get show" do
    get theater_users_show_url
    assert_response :success
  end
end
