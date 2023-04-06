# frozen_string_literal: true

# This is the main file which will be responsible
# for receiving the input file and call the method to process it

require './file_parser'
require './receipt'

input_filename = ARGV[0]
parser = FileParser.new(input_filename)

if parser.validate
  basket_items = parser.to_list

  receipt = Receipt.new(basket_items)

  # prints output
  basket_items.each do |item|
    puts "#{item.quantity} #{item.product_name}: #{format('%.2f', item.final_price)}"
  end
  puts "Sales Taxes: #{format('%.2f', receipt.total_taxes)}"
  puts "Total: #{format('%.2f', receipt.total_price_with_taxes)}"
else
  parser.errors.each do |error|
    puts error.message
  end
end
