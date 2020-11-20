require 'test_helper'

class CountFactorialsControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get count_factorials_input_url
    assert_response :success
  end

  test "should get view" do
    get count_factorials_view_url
    assert_response :success
  end

  test "should get 4 numbers" do
    get count_factorials_view_url
    assert_equal(assigns[:array_of_rows].size, 4)
  end

end
