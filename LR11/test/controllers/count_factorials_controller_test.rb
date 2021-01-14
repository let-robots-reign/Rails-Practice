require 'test_helper'

class CountFactorialsControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get input_url
    assert_response :success
  end

  test "should get view" do
    get view_url
    assert_response :success
  end

  test 'results are different for different inputs' do
    get view_url, params: {max_n: 3}
    first_response = response.body

    get view_url, params: {max_n: 6}
    second_response = response.body

    assert_not_equal first_response, second_response
  end
end
