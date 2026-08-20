require "test_helper"

class Theater::RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theater_recruitments_index_url
    assert_response :success
  end

  test "should get show" do
    get theater_recruitments_show_url
    assert_response :success
  end

  test "should get new" do
    get theater_recruitments_new_url
    assert_response :success
  end

  test "should get edit" do
    get theater_recruitments_edit_url
    assert_response :success
  end
end
