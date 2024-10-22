require "test_helper"

class BreedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breeds_index_url
    assert_response :success
  end

  test "should get show" do
    get breeds_show_url
    assert_response :success
  end

  test "should get search" do
    get breeds_search_url
    assert_response :success
  end
end
