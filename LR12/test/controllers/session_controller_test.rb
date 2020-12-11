require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  def setup
    User.create(username: 'zotov', password: '1')
  end

  test 'should get login' do
    get login_url
    assert_response :success
  end

  test 'should get logout' do
    get logout_url
    assert_response :redirect
    assert_redirected_to welcome_url
  end

  test 'should fail to login with incorrect data' do
    post login_url, params: { username: users(:valid).username, password: '12' }
    assert_response :no_content
  end

  test 'should fail to count factorials without login' do
    get input_url
    assert_redirected_to welcome_url
  end

  test 'should login with correct data and compute' do
    post login_url, params: { username: users(:valid).username, password: '1' }
    assert_response :redirect
    assert_redirected_to input_url

    get view_url, params: {max_n: 10}
    assert_equal(assigns[:array_of_rows].size, 4)
  end

  def teardown
    User.find_by_username('zotov').destroy
  end
end
