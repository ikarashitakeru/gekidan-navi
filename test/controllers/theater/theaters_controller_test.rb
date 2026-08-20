require "test_helper"

class Theater::TheatersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get theater_theaters_show_url
    assert_response :success
  end

  test "should get edit" do
    get theater_theaters_edit_url
    assert_response :success
  end
end
