require "test_helper"

class Admin::ValuatuonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_valuatuons_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_valuatuons_edit_url
    assert_response :success
  end
end
