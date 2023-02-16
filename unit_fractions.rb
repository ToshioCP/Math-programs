require_relative "axby1.rb"

=begin rdoc
This file adds generate_unit_fractions method to the Rational class.
It generates a sum of unit fractions that the denominators are all different.
For example,

3/4 = 1/2 + 1/6 + 1/12

The sum can have two or more patterns.

3/4 = 1/2 + 1/6 + 1/12 = 1/2 + 1/4

But the method generates only one pattern because it uses the following algorithm.

- a/b is given.
- find the solution (x, y) of the equation ax + by = 1
- a/b = (-y)/x + 1/bx, and x < b

The second term of the right hand side is a unit fraction.
The denominator of the first term is less than b
So, if you do the same to (-y)/x, the denominator of the first term goes smaller and smaller.
Finally, you can get the sum of unit fractions.
=end
class Rational
  # Returns an array of unit fractions.
  # If self is not a proper fraction, the first element of the array is an integer.
  def generate_unit_fractions
    i = self.floor
    a = (self-i).numerator
    b = (self-i).denominator
    s = []
    while a > 1 do
      axby1 = Axby1.new(a, b)
      x, y = axby1.solve
      return nil unless x
      s << Rational(1,b*x)
      a, b = -y, x
    end
    s << Rational(a,b)
    s << i unless i == 0
    return s.reverse
  end
end
