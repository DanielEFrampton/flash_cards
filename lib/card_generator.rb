require './lib/card'
require 'pry'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  # Convert data in file into array of cards, returns that array
  def cards
    # Open and iterate on file contents to create individual cards, closes automatically
    File.open(filename, "r") do |file|
      file.readlines.map do |line|
        card_elements = line.chomp.split(",")
        Card.new(card_elements[0], card_elements[1], card_elements[2].to_sym)
      end
    end
  end
end
