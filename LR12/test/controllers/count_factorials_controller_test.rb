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

  test 'results are different for different inputs' do
    get count_factorials_view_url, params: {max_n: 3}
    first_response = response.body

    get count_factorials_view_url, params: {max_n: 6}
    second_response = response.body

    assert_not_equal first_response, second_response
  end
end
