require "readline"
require_relative "axby1.rb"
require_relative "unit_fractions.rb"
require_relative "e10p.rb"

def usage
  print "Usage: ruby demo.rb\n"
end

print "----- axby1.rb -----\n"
print "This app solves an equation ax+by=1\n"
print "Input a and b.\n"
print "Delimit the arguments with blank character.\n"
buf = Readline.readline("> ", false)
e = Axby1.new(*buf.split(/ +/).map{|s| s.to_i})
x, y = e.solve
if x != nil
  print "#{e.a} x (#{x}) + #{e.b} x (#{y}) = 1\n"
end

print "----- unit_fractions.rb -----\n"
print "This app expands a fraction a/b into the sequence of unit fractions.\n"
print "Input a and b.\n"
print "Delimit the arguments with blank character.\n"
buf = Readline.readline("> ", false)
r = Rational(*buf.split(/ +/).map{|s| s.to_i})
print "#{r} = #{r.generate_unit_fractions.map{|x| x.to_s}.join(" + ")}\n"

print "----- e10p.rb (extracted TenPuzzle) -----\n"
print "This app finds an expression with the numbers and basic arithmetic operations and its value equals the sum you gave.\n"
print "Input integers a, b, ... and sum.\n"
print "Delimit the arguments with blank character.\n"
buf = Readline.readline("> ", false)
array = buf.split(/ +/).map{|s| s.to_i}
sum = array.pop
puzzle = E10P.new(array, sum)
print "#{puzzle.problem}\n"
print "#{puzzle.solve}\n"
 