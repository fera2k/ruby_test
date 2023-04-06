# frozen_string_literal: true

require './shop_item'

# Validate the input file name and parse file to list of items
class FileParser
  attr_reader :errors

  def initialize(filename)
    @filename = filename
    @lines = IO.readlines(@filename)
    @errors = []
  end

  def validate
    exists? && content?
  end

  def to_list
    list = []
    @lines.each do |line|
      qty, name, list_price = parse_line(line)
      list << ShopItem.new(name, qty, list_price)
    end
    list
  end

  private

  def parse_line(line)
    parts = line.split(' ')
    qty = parts.slice(0).to_i
    price = parts.slice(-1)
    name = parts.slice(1, parts.length - 3).join(' ')
    [qty, name, price]
  rescue StandardError
    @errors << 'input not valid'
  end

  def exists?
    return true if File.exist?(@filename)

    @errors << 'File not found'
    false
  end

  def content?
    return true if @lines.size.positive?

    @errors << 'File does not have content'
    false
  end
end
