# frozen_string_literal: true

# User enter name of product, price(for single item) and quantity of items
# Then with this data create hash with key = product_name and
# value = {price, quantity}. Then sum up the total amout of purchases.

purchases = {}
loop do
  puts 'Enter product name or stop: '
  product_name = gets.chomp
  break if product_name == 'stop'

  puts 'Enter product price(for single item): '
  product_price = gets.chomp.to_f
  puts 'Enter product quantity: '
  product_quantity = gets.chomp.to_f
  purchases[product_name] = { price: product_price, quantity: product_quantity }
end
total_sum = 0.0
purchases.each do |_, props|
  total_sum += props[:price] * props[:quantity]
end
puts "Total sum = #{total_sum}"
