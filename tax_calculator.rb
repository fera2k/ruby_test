# frozen_string_literal: true

# Calculate the round up taxes
class TaxCalculator
  IMPORT_TAX = 0.05
  SALES_TAX = 0.10

  def self.sales_tax(price)
    round_up_tax(price.to_f * SALES_TAX)
  end

  def self.import_tax(price)
    round_up_tax(price.to_f * IMPORT_TAX)
  end

  def self.round_up_tax(value)
    rounded_num_hundreds = (value.round(2) * 100).to_i
    rounded_num_hundreds += 1 until (rounded_num_hundreds % 5).zero?
    rounded_num_hundreds.to_f / 100
  end

  private_class_method :round_up_tax
end
