require 'minitest/autorun'
require_relative '../lib/math_programs.rb'

include MathPrograms

class TestE10p < Minitest::Test
  def test_acr
    example = [%w{-1+2*2 3}, %w{3+(1/2) 7/2}, %w{3*(1+1/3) 4}, %w{1/2+1/3 5/6}]
    example.each do |a, result|
      assert_equal Rational(result), ACR.new(a).calc
    end
  end
end
