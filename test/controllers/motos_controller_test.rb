require "test_helper"

class MotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get motos_index_url
    assert_response :success
  end

  test "should get show" do
    get motos_show_url
    assert_response :success
  end
end
