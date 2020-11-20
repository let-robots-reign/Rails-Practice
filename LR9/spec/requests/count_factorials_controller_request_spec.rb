require 'rails_helper'
require 'selenium-webdriver'

include RSpec::Expectations
describe "CountFactorialsController" do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "http://localhost:3000"
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    expect(@verification_errors).to eq([])
  end

  it "test_factorials" do
    @driver.get(@base_url)
    @driver.find_element(:id, "get-result").click
    wait = Selenium::WebDriver::Wait.new(:timeout => 2)
    result = wait.until { @driver.find_element(:id, "rows-number") }
    verify { expect(result.text).to eq("4") }
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
