#!/usr/bin/ruby

class Wrapper

  def initialize
  end

  def parse_file(filename = '')
    input = File.read(filename).chomp
    parsed_input_arr = input.split("\n")
  end

  def parse_order(order)
    arr = order.split('x').map(&:to_i).sort
  end

  def calculate_total_wrapping_paper(arr)
    sqf = 0
    arr.each do |order|
      arr = parse_order(order)
      sqf += calculate_square_footage(arr)
    end
    return sqf
  end
  
  def calculate_square_footage(arr)
    sqf = 0
    sqf += 3 * arr[0] * arr[1]
    sqf += 2 * arr[0] * arr[2]
    sqf += 2 * arr[1] * arr[2]
    return sqf
  end

  def calculate_total_ribbon(arr)
    rf = 0
    arr.each do |order|
      arr = parse_order(order)
      rf += calculate_ribbon_needed(arr)
    end
    return rf
  end

  def calculate_ribbon_needed(arr)
    rf = 0
    rf += 2 * arr[0] + 2 * arr[1]
    rf += arr[0] * arr[1] * arr[2]
  end

end
