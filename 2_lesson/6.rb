products = {}

loop do
  total_price = 0

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

  puts products

  products.each{ |product, value|
    product_total_price = value[:price] * value[:amount]
    puts "#{product} has total price #{product_total_price}"
    total_price += product_total_price
  }

  puts "Total price is #{total_price}"

end
