require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

end
