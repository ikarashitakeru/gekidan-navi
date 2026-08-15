require "test_helper"

class Public::RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_recruitments_index_url
    assert_response :success
  end

  test "should get show" do
    get public_recruitments_show_url
    assert_response :success
  end
end
