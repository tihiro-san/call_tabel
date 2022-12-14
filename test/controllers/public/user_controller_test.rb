require "test_helper"

class Public::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_user_index_url
    assert_response :success
  end

  test "should get show" do
    get public_user_show_url
    assert_response :success
  end
end
