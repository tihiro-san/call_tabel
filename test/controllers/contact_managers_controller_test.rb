require "test_helper"

class ContactManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contact_managers_create_url
    assert_response :success
  end
end
