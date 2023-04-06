# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../tax_exempt'
require_relative '../shop_item'

describe TaxExempt do
  it 'book should be exemptible' do
    item = ShopItem.new('book')
    expect(TaxExempt.exemptible?(item)).to eq(true)
  end

  it 'guiness book should be exemptible' do
    item = ShopItem.new('guinness book')
    expect(TaxExempt.exemptible?(item)).to eq(true)
  end

  it 'imported book should be exemptible' do
    item = ShopItem.new('imported book')
    expect(TaxExempt.exemptible?(item)).to eq(true)
  end

  it 'chocolate should be exemptible' do
    item = ShopItem.new('chocolate')
    expect(TaxExempt.exemptible?(item)).to eq(true)
  end

  it 'the best chocolate should be exemptible' do
    item = ShopItem.new('the best chocolate')
    expect(TaxExempt.exemptible?(item)).to eq(true)
  end

  it 'beer should NOT be exemptible' do
    item = ShopItem.new('the best beer')
    expect(TaxExempt.exemptible?(item)).to eq(false)
  end

  it 'box of paper should not be exemptible' do
    item = ShopItem.new('box of paper')
    expect(TaxExempt.exemptible?(item)).to eq(false)
  end

  it 'covid vaccine' do
    item = ShopItem.new('covid vaccine')
    expect(TaxExempt.exemptible?(item)).to eq(true)
  end

  it 'pills in plural should be exemptible' do
    item = ShopItem.new('headache pills')
    expect(TaxExempt.exemptible?(item)).to eq(true)
  end
end

# rubocop:enable Metrics/BlockLength
