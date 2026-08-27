require "test_helper"

class Admin::RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_recruitments_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_recruitments_show_url
    assert_response :success
  end
end
