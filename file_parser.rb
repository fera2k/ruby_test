# frozen_string_literal: true

require 'shop_item'

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
      list << ShopItem.new(parse_line(line))
    end
    list
  end

  private

  def parse_line(line)
    parts = line.split(' ')
    qty = parts.slice(0)
    price = parts.slice(-1)
    name = parts.slice(1, parts.length - 3).join(' ')
    [qty, name, price]
  rescue StandardError
    @errors << 'input not valid'
  end

  def exists?
    @errors << 'File not found' unless File.exist?(@filename)
  end

  def content?
    @errors << 'File does not have content' unless @lines.size.positive?
  end
end
