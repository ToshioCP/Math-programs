require 'minitest/autorun'
require_relative '../lib/math_programs.rb'

include MathPrograms

class TestE10p < Minitest::Test
  def test_e10p
    [[[2,3,5],17], [[11,23,7], 5], [[1,2,3,4], 11]].each do |a, s|
      puzzle = E10P.new(a, s)
      assert_equal "#{a}, #{s}", puzzle.problem
      assert_equal s, ACR.new(puzzle.solve).calc
    end

    # The following can't solve.
    a, s = [1,1,1,1], 10 
    puzzle = E10P.new(a, s)
    assert_equal "#{a}, #{s}", puzzle.problem
    assert_equal "", puzzle.solve
  end
end
