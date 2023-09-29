require 'minitest/autorun'
require_relative '../lib/math_programs.rb'

include MathPrograms

class TestAxby1 < Minitest::Test
  def test_axby1
    [[10,7], [-2,11], [5,-2],[33,56],[-28,141]].each do |a,b|
      axby1 = Axby1.new(a,b)
      x, y = axby1.solve
      refute_nil x
      assert_equal 1, a*x+b*y
    end
    [[10,6], [-2,10], [5,-20],[33,55],[-28,140]].each do |a,b|
      axby1 = Axby1.new(a,b)
      assert_nil axby1.solve
    end
    axby1 = Axby1.new
    assert_nil axby1.solve
    axby1.a, axby1.b = 25, 36
    x, y = axby1.solve
    refute_nil x
    assert_equal 1, 25*x+36*y
  end
end
