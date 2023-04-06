# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../tax_calculator'
require_relative '../shop_item'

describe ShopItem do
  it 'perfume should be sales taxed' do
    item = ShopItem.new('perfume', 1, 5)
    expect(item.sales_tax).to be > 0
  end

  it 'food should be not be sales taxed' do
    item = ShopItem.new('orange fruit', 10, 1.5)
    expect(item.sales_tax).to be 0
  end

  it 'imported perfume should have import tax' do
    item = ShopItem.new('imported perfume', 1, 5)
    expect(item.import_tax).to be > 0
  end

  it 'local product should not have import tax' do
    item = ShopItem.new('local product', 1, 5)
    expect(item.import_tax).to be 0
  end

  it 'taxable product should have 10% sales tax' do
    item = ShopItem.new('taxable product', 1, 10)
    expect(item.sales_tax).to be (10 * TaxCalculator::SALES_TAX).to_f
  end

  it 'imported product should have 5% sales tax' do
    item = ShopItem.new('imported product', 1, 10)
    expect(item.import_tax).to be (10 * TaxCalculator::IMPORT_TAX).to_f
  end

  it 'should have total list price right' do
    item = ShopItem.new('imported product', 2, 10)
    expect(item.total_list_price).to be (2 * 10).to_f
  end

  it 'should have final price right' do
    total_list_price = 2 * 10
    total_taxes = total_list_price * TaxCalculator::IMPORT_TAX + total_list_price * TaxCalculator::SALES_TAX
    item = ShopItem.new('imported product', 2, 10)
    expect(item.final_price).to be total_list_price.to_f + total_taxes.to_f
  end

  it 'should have final final_price right' do
    total_list_price = 27.99
    item = ShopItem.new('imported product', 1, total_list_price)
    expect(item.final_price).to be 32.19
  end
end

# rubocop:enable Metrics/BlockLength
