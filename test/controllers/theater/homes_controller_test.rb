require "test_helper"

class Theater::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get theater_homes_top_url
    assert_response :success
  end
end
