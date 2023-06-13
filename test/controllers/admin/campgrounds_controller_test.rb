require "test_helper"

class Admin::CampgroundsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_campgrounds_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_campgrounds_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_campgrounds_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_campgrounds_edit_url
    assert_response :success
  end
end
