fibonacci_numbers = []
previous_number = 1
next_number = 1

(1..100).each do |number|

  if number == next_number
    next_number = previous_number + number
    previous_number = number
    fibonacci_numbers.push(next_number);
  end
end

puts fibonacci_numbers