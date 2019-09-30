require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end
end
