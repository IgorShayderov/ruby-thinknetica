puts "Please, write basis of triangle"
triangle_basis = gets.chomp

puts "Please, write height of triangle"
triangle_height = gets.chomp

square_of_triangle = 0.5 * triangle_basis.to_f * triangle_height.to_f

puts square_of_triangle
