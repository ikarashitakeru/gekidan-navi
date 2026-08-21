require "test_helper"

class Theater::ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theater_applications_index_url
    assert_response :success
  end

  test "should get show" do
    get theater_applications_show_url
    assert_response :success
  end
end
