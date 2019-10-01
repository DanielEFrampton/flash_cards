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

  def test_deck_method_returns_deck
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_it_begins_with_empty_turns_array
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    assert_equal [], round.turns
    assert_empty round.turns
  end

  def test_it_provides_first_card_in_deck_as_current_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    assert_equal card1, round.current_card
  end

  def test_take_turn_creates_turn_object_with_current_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    assert_instance_of Turn, round.take_turn("Juneau")

    turn1 = round.take_turn("Juneau")
    assert_equal card1, turn1.card
  end

  def test_take_turn_objects_true_with_correct_input
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    turn1 = round.take_turn("Juneau")
    assert turn1.correct?
  end

  def test_take_turn_objects_false_with_incorrect_input
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    turn2 = round.take_turn("Bleuneau")
    refute turn2.correct?
  end

  def test_it_pushes_turns_onto_turn_array
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)
    turn1 = round.take_turn("whatevs")

    assert turn1, round.turns[0]

    turn2 = round.take_turn("meh")
    assert turn2, round.turns[1] 
  end

end
