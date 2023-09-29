=begin rdoc
This program, e10p.rb, solves the extended TenPuzzle.
TenPuzzle is like this:

You are given four digits.
You try to make the number 10 with the four numbers and four basic arithmetic oprations (+, -, *, /).

- Example: 2, 3, 5, 7 is given.
- Answer: 3*5+2-7 = 10

This program extends the puzzle in two ways.

- You can give two or more any positive integers
- You can give any number for the sum.

This program is a library.
You need to make your own main program.

Usage:

1. require or require_relative this library.
2. Create an instance with numbers and a sum. For example, <tt>puzzle = E10P.new([1,3,5], 8)</tt>
3. Call the solve method of the instance. For example, <tt>s = puzzle.solve</tt>
4. The return value is a string that is the answer. i.e. <tt> s == "a*3+5 </tt>"
=end

# The following code extends the class Numeric.
# The derived classes, for example, Integer and Rational, are also extended.
class Numeric
  def value
    self
  end
end

module MathPrograms
  class E10P
    # Node is a node in an expression.
    #
    # Example: 2+3\*4
    #
    # The expression above has two nodes, \+ and \*.
    # It is implemented as follows in the program.
    #
    #    +
    #   / \
    #  2   *
    #     / \
    #    3   4
    #
    # The node at the bottom has operator \* and numbers 3 and 4. The result is twelve.
    # It has three elements @op, @a and @b, which are correspond to \*, 3 and 4.
    # Let this node be "X".
    # The node at the top has \*, 2 and a node X.
    class Node
      attr_accessor :op, :a, :b
      def initialize op, a, b
        @op, @a, @b = op, a, b
      end
      def value
        case @op
        when "+"
          @a.value + @b.value
        when "-"
          @a.value - @b.value
        when "*"
          @a.value * @b.value
        when "/"
          Rational(@a.value, @b.value) if @b.value != 0
        else
          nil
        end
      end
      def to_s
        if @op == "*" || @op == "/"
          if @a.is_a?(Node) && (@a.op == "+" || @a.op == "-")
            a = "(#{@a})"
          else
            a = "#{@a}"
          end
          if @b.is_a?(Node) && (@b.op == "+" || @b.op == "-" || @op == "/")
            b = "(#{@b})"
          else
            b = "#{@b}"
          end
        elsif @op == "-" && @b.is_a?(Node) && (@b.op == "+" || @b.op == "-")
          a = "#{@a}"
          b = "(#{@b})"
        else
          a = "#{@a}"
          b = "#{@b}"
        end
        a+@op+b
      end
    end

    attr_reader :a, :s
    def initialize a, s
      @a, @s = a, s
    end

    # Return the problem.
    def problem
      "#{@a}, #{@s}"
    end

    # Solve the problem.
    #
    # Return: string. If no solution, empty string (nil.to_s) is returned.
    def solve
      solve_real(@a, @s).to_s
    end

  private

    # Solve the problem
    # return: node or nil
    def solve_real(nums, a)
      if nums.size == 1
        nums[0].value == a ? a : nil
      elsif nums.size == 2
        if a == nums[0].value+nums[1].value
          Node.new("+", nums[0], nums[1])
        elsif a == nums[0].value-nums[1].value
          Node.new("-", nums[0], nums[1])
        elsif a == nums[1].value-nums[0].value
          Node.new("-", nums[1], nums[0])
        elsif a == nums[0].value*nums[1].value
          Node.new("*", nums[0], nums[1])
        elsif nums[1].value != 0 && a == Rational(nums[0].value,nums[1].value)
          Node.new("/", nums[0], nums[1])
        elsif nums[0].value != 0 && a == Rational(nums[1].value,nums[0].value)
          Node.new("/", nums[1], nums[0])
        else
          nil
        end
      else
        nums.permutation(2) do |x,y|
          z = nums.dup
          i = z.index(x)
          z.delete_at(i)
          i = z.index(y)
          z.delete_at(i)
          s = solve_real(z+[Node.new("+", x, y)], a)
          return s if s
          s = solve_real(z+[Node.new("-", x, y)], a)
          return s if s
          s = solve_real(z+[Node.new("-", y, x)], a)
          return s if s
          s = solve_real(z+[Node.new("*", x, y)], a)
          return s if s
          if y.value != 0
            s = solve_real(z+[Node.new("/", x, y)], a)
            return s if s
          end
          if x.value != 0
            s = solve_real(z+[Node.new("/", y, x)], a)
            return s if s
          end
        end
        nil
      end
    end
  end
end
