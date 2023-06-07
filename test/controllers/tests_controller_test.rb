require "test_helper"

class TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get tests_edit_url
    assert_response :success
  end

  test "should get update" do
    get tests_update_url
    assert_response :success
  end
end
