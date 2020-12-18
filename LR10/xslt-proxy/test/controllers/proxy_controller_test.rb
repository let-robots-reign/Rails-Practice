require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get proxy_input_url
    assert_response :success
  end

  test 'should get output' do
    get proxy_output_url
    assert_response :success
  end

  test 'should return XML' do
    get proxy_output_url, params: { side: 'client' }
    xml = Nokogiri::XML(response.body)
    factorial = xml.search('factorial').first.text
    assert_equal factorial, "3"
  end

  test 'should return HTML' do
    get proxy_output_url, params: { side: 'server' }
    # 4 numbers in total
    assert_select 'table/tbody/tr', count: 4
  end

end
