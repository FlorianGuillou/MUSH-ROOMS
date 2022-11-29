require "test_helper"

class MushroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mushrooms_show_url
    assert_response :success
  end
end
