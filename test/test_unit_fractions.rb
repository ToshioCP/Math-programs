require 'minitest/autorun'
require_relative '../lib/math_programs.rb'

include MathPrograms

class TestUnitFractions < Minitest::Test
  def test_unit_fractions
    ["5/6", "2/7", "10/19","23/34","101/102"].each do |s|
      r = Rational(s)
      u_fractions = r.generate_unit_fractions
      u_fractions.each do |uf|
        assert_equal 1, uf.numerator
      end
      assert_equal r, u_fractions.sum
    end
  end
end
