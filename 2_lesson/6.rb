products = {}
total_price = 0

loop do

  puts "Please, print name of a product (print 'stop' to stop)."
  product = gets.chomp

  break if product == "stop"

  puts "Please, print price of a product."
  price = gets.chomp.to_f

  puts "Please, print amount of a product."
  amount = gets.chomp.to_f

  products[product] = {
    price: price,
    amount: amount,
  }
end

  puts products

  products.each do |product, value|
    product_total_price = value[:price] * value[:amount]
    puts "#{product} has total price #{product_total_price}"
    total_price += product_total_price
  end

  puts "Total price is #{total_price}"

