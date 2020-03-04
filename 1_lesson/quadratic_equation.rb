puts "Please, write first coefficient"
first_coefficient = gets.chomp.to_i

puts "Please, write second coefficient"
second_coefficient = gets.chomp.to_i

puts "Please, write third coefficient"
third_coefficient = gets.chomp.to_i

discriminant = Math.sqrt(second_coefficient) - 4 * first_coefficient * third_coefficient

if discriminant > 0
  root_1 = -second_coefficient / (2 * first_coefficient)
  puts "Discriminant is #{discriminant}. Root is #{root_1}."
elsif discriminant = 0
  root_1 = (-second_coefficient + third_coefficient) / (2 * first_coefficient)
  root_2 = (-second_coefficient - third_coefficient) / (2 * first_coefficient)
  puts "Discriminant is #{discriminant}. First root is #{root_1}, second root is #{root_2}."
else discriminant < 0
  puts "Discriminant is #{discriminant}. There are no square roots."
end
