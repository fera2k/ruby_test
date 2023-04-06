# frozen_string_literal: true

# Returns the list of shop items and sales taxes
class Receipt
  def initialize(shop_items)
    @shop_items = shop_items
  end

  def items_count
    @shop_items.count
  end

  def total_taxes
    shop_items.inject(0) { |sum, item| sum + item.sales_tax + item.import_tax }
  end

  def total_price_with_taxes
    shop_items.inject(0) { |sum, item| sum + item.final_price }
  end
end
