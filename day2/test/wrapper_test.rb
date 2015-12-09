#!/usr/bin/ruby

require 'minitest/autorun'
require '../lib/wrapper.rb'

class WrapperTest < Minitest::Test

  def test_parse_input
    wrapper = Wrapper.new
    arr = wrapper.parse_order('1x2x3')
    assert_equal( [1, 2, 3], arr)
    assert( 26, wrapper.calculate_square_footage(arr) )
  end

  def test_parse_input_unordered
    wrapper = Wrapper.new
    arr = wrapper.parse_order('3x1x2')
    assert_equal( [1, 2, 3], arr)
    assert( 26, wrapper.calculate_square_footage(arr) )
  end

  def test_ribbon_needed
    wrapper = Wrapper.new
    arr = wrapper.parse_order('1x2x3')
    assert_equal( [1, 2, 3], arr)
    assert( 12, wrapper.calculate_ribbon_needed(arr) )
  end

  def test_ribbon_needed_unordered
    wrapper = Wrapper.new
    arr = wrapper.parse_order('3x1x2')
    assert_equal( [1, 2, 3], arr)
    assert( 12, wrapper.calculate_ribbon_needed(arr) )
  end    

end
