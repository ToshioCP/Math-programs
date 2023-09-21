require_relative '../e10p.rb'

puzzle = E10P.new([2,3,5], 17)
print "#{puzzle.problem}\n"
print "#{puzzle.solve}\n"
print "\n"
puzzle = E10P.new([11,23,7], 5)
print "#{puzzle.problem}\n"
print "#{puzzle.solve}\n"
puzzle = E10P.new([1,2,3,4], 11)
print "#{puzzle.problem}\n"
print "#{puzzle.solve}\n"
puzzle = E10P.new([6,5,22,3,44], 38)
print "#{puzzle.problem}\n"
print "#{puzzle.solve}\n"
