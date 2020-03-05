fibonacci_numbers = []
count = 100
number = 1
previous_number = 1

while number <= count do
  fibonacci_numbers.push(number)
  number, previous_number = previous_number, number + previous_number
end

puts fibonacci_numbers