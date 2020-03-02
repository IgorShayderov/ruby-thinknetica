puts "Please, write your name"
user_name = gets.chomp

puts "Please, write your height"
user_height = gets.chomp

ideal_weight = (user_height.to_i - 110) * 1.15

if (ideal_weight < 0) 
	puts "Your height is already optimum"
else 
	puts "#{user_name.capitalize} your optimum weight is #{ideal_weight}."
end
