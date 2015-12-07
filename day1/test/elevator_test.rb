require 'minitest/autorun'
require_relative 'elevator.rb'

class ElevatorTest < Minitest::Test

  def test_default_scenario
    assert_equal( 0, Elevator.determine_destination('') )
  end

  def test_one_floor_up
    assert_equal( 1, Elevator.determine_destination('(') )
  end
    
  def test_one_floor_down
    assert_equal( -1, Elevator.determine_destination(')') )
  end

  def test_multiple_floors_but_end_at_zero
    assert_equal( 0, Elevator.determine_destination('(())') )
    assert_equal( 0, Elevator.determine_destination('()()') )
  end

  def test_multiple_floors_but_end_at_floor_three
    assert_equal( 3, Elevator.determine_destination('(((') )
    assert_equal( 3, Elevator.determine_destination('(()(()(') )
    assert_equal( 3, Elevator.determine_destination('))(((((') )
  end

  def test_multiple_floors_but_end_at_one_below
    assert_equal( -1, Elevator.determine_destination('())') )
    assert_equal( -1, Elevator.determine_destination('))(') )    
  end

  def test_mulitple_floors_but_end_at_three_blow
    assert_equal( -3, Elevator.determine_destination(')))') )
    assert_equal( -3, Elevator.determine_destination(')())())') ) 
  end

  def test_first_basement_floor
    assert_equal( 1, Elevator.determine_first_basement(')))))') )
    assert_equal( 3, Elevator.determine_first_basement('())((') )
    assert_equal( 5, Elevator.determine_first_basement('(()))') )
  end

end
