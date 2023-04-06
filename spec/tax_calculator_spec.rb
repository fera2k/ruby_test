# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../tax_calculator'

# salex tax = 10%
# import tax = 5%

describe TaxCalculator do
  context 'when price is integer' do
    it 'will calculate correct sales tax' do
      price = 100
      expect(TaxCalculator.sales_tax(price)).to eq(10)
    end

    it 'will calculate correct import taxes' do
      price = 100
      expect(TaxCalculator.import_tax(price)).to eq(5)
    end
  end

  context 'when price is decimal' do
    let(:price) { 27.99 }
    it 'will calculate rounded up sales tax' do
      expect(TaxCalculator.sales_tax(price)).to eq(2.8)
    end

    it 'will calculate rounded up import taxes' do
      expect(TaxCalculator.import_tax(price)).to eq(1.4)
    end
  end

  context 'when price is decimal - 2nd sample' do
    let(:price) { 47.50 }
    it 'will calculate rounded up sales tax' do
      expect(TaxCalculator.sales_tax(price)).to eq(4.75)
    end

    it 'will calculate rounded up import taxes' do
      expect(TaxCalculator.import_tax(price)).to eq(2.4)
    end
  end
end

# rubocop:enable Metrics/BlockLength
