require "test_helper"

class Admin::CallHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_call_histories_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_call_histories_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_call_histories_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_call_histories_edit_url
    assert_response :success
  end
end
