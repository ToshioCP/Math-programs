require_relative "axby1.rb"
require_relative "unit_fractions.rb"

def usage
  print "Usage: ruby demo.rb a b\n"
  print "       a: an integer.\n"
  print "       b: an non-zero integer.\n"
end

a, b = ARGV[0].to_i, ARGV[1].to_i
if b == 0
  usage
  exit
end

print "----- axby1.rb -----\n"
e = Axby1.new(a, b)
x, y = e.solve
if x != nil
  print "#{e.a} x (#{x}) + #{e.b} x (#{y}) = 1\n"
end

print "----- unit_fractions.rb -----\n"
r = Rational(ARGV[0].to_i,ARGV[1].to_i)
print "#{r} = #{r.generate_unit_fractions.map{|x| x.to_s}.join(" + ")}\n"