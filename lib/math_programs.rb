module MathPrograms
end

['axby1.rb', 'unit_fractions.rb', 'e10p.rb', 'acr.rb'].each do |file|
  require_relative 'math_programs/'+file
end
