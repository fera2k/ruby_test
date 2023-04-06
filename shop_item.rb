# frozen_string_literal: true

require './tax_exempt'
require './tax_calculator'

# represents the item in the shop list
class ShopItem
  attr_accessor :product_name, :quantity, :list_price
  attr_reader :total_list_price

  def initialize(product_name, quantity = 0, list_price = 0)
    @product_name = product_name
    @quantity = quantity.to_f
    @unit_list_price = list_price.to_f
    @total_list_price = @unit_list_price * @quantity
  end

  def sales_tax
    return 0 if TaxExempt.exemptible?(self)

    TaxCalculator.sales_tax(@total_list_price)
  end

  def import_tax
    return 0 unless imported?

    TaxCalculator.import_tax(@total_list_price)
  end

  def final_price
    @total_list_price + sales_tax + import_tax
  end

  private

  def imported?
    @product_name.include? 'imported'
  end
end
