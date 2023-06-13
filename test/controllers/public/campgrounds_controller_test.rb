require "test_helper"

class Public::CampgroundsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_campgrounds_new_url
    assert_response :success
  end

  test "should get index" do
    get public_campgrounds_index_url
    assert_response :success
  end

  test "should get map" do
    get public_campgrounds_map_url
    assert_response :success
  end

  test "should get show" do
    get public_campgrounds_show_url
    assert_response :success
  end

  test "should get thanks" do
    get public_campgrounds_thanks_url
    assert_response :success
  end

  test "should get status" do
    get public_campgrounds_status_url
    assert_response :success
  end
end
