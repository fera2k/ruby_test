# frozen_string_literal: true

# returns if shop item is tax exempt
class TaxExempt
  BOOKS = %w[book magazine].freeze
  FOODS = %w[chocolate fruit sandwich].freeze
  MEDICAL_PRODUCTS = %w[pill vaccine].freeze

  def self.exemptible?(item)
    food?(item) || book?(item) || medical_product?(item)
  end

  def self.book?(item)
    BOOKS.any? { |book| item.product_name.include?(book) }
  end

  def self.food?(item)
    FOODS.any? { |food| item.product_name.include?(food) }
  end

  def self.medical_product?(item)
    MEDICAL_PRODUCTS.any? { |medical| item.product_name.include?(medical) }
  end

  private_class_method :book?, :food?, :medical_product?
end
