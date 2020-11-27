require 'test_helper'

class FactorialAlgoTest < ActiveSupport::TestCase
  test 'should not save' do
    rows_record = FactorialAlgo.new
    assert !rows_record.save
  end

  test 'should not find in empty' do
    assert !FactorialAlgo.exists?(:max_n => 20)
  end

  test 'should save and find' do
    rows_record = FactorialAlgo.new
    rows_record.max_n = 3
    rows_record.result = ActiveSupport::JSON.encode([1, 3, 2]) # id = 1: 3! = 1 * 2 * 3
    assert rows_record.save

    assert FactorialAlgo.exists?(:max_n => 3)

    rows_record = FactorialAlgo.new
    rows_record.max_n = 3
    rows_record.result = ActiveSupport::JSON.encode([1, 3, 2]) # id = 1: 3! = 1 * 2 * 3
    assert !rows_record.save
  end
end
