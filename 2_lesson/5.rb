def is_year_leap(year)
  if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  end 
end

count = 0

puts "Please, write number."
number = gets.chomp.to_i

puts "Please, write month. From 1 to 12."
month = gets.chomp.to_i

puts "Please, write year."
year = gets.chomp.to_i

months = {
  january: 31,
  february: is_year_leap(year) ? 29 : 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31,
}

if month == 1
  count = number
else 
  # отнимаем 1 тк отсчет массивов начинается с 0
  months.keys[0..month - 1].each{|month|
    count += months[month]
    puts month
  }
  count += number
end

puts "Date sequence number is #{count}"
