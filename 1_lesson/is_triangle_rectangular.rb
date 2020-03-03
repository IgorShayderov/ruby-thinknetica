def get_side_sqr(height)
  side_sqr = height.to_i**2
end

puts "Please, write length of first side"
first_side = get_side_sqr(gets.chomp)

puts "Please, write length of second side"
second_side = get_side_sqr(gets.chomp)

puts "Please, write length of third side"
third_side = get_side_sqr(gets.chomp)

if first_side == second_side && first_side == third_side
  puts "Triangular is isosceles and equilateral."
elsif third_side < first_side && first_side > second_side
  puts "Triangular is rectangular. Hypotenuse is first side."
elsif third_side < second_side && second_side > first_side
  puts "Triangular is rectangular. Hypotenuse is second side."
elsif second_side < third_side && third_side > first_side
  puts "Triangular is rectangular. Hypotenuse is third side."
else puts "Error in sides comparing."
end
