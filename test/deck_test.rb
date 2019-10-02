require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  attr_reader :deck, :card1, :card2, :card3, :card4, :cards

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    @card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    @card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    @cards = [card1, card2, card3, card4]
    @deck = Deck.new(cards)
  end

  def test_it_exists
    assert_instance_of Deck, deck
  end

  def test_it_contains_array_of_cards
    assert_instance_of Card, deck.cards.first
    assert_instance_of Array, deck.cards
  end

  def test_it_counts_number_of_cards
    assert_equal 4, deck.count
  end

  def test_it_returns_array_of_cards_in_given_category
    assert_equal [card1, card2], deck.cards_in_category(:Geography)
    assert_equal [card3, card4], deck.cards_in_category(:SF_Trivia)
  end

  def test_it_returns_empty_array_of_cards_in_nonexistant_category
    assert_empty deck.cards_in_category("Pop Culture")
  end

end
