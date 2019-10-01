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

  def test_take_turn_creates_turn_object
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    assert_instance_of Turn, round.take_turn("Juneau")
  end

  def test_take_turn_creates_turn_using_current_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

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

  def test_it_counts_correct_guesses_in_turns_array
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    round.take_turn("Juneau")
    assert_equal 1, round.number_correct
    round.take_turn("Indianapolis")
    assert_equal 2, round.number_correct
    round.take_turn("Dune..?")
    assert_equal 2, round.number_correct
    round.take_turn("Minas Tirith")
    assert_equal 3, round.number_correct
  end

  def test_it_moves_current_card_to_end_of_turns_array_after_turn_taken
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    turn1 = round.take_turn("Juneau")
    refute_equal card1, round.current_card
    assert_equal card1, round.deck.cards.last
    assert_equal card2, round.current_card
  end

  def test_it_can_count_number_of_turns
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    round.take_turn("Juneau")
    assert_equal 1, round.turns.count
    round.take_turn("Indianapolis")
    assert_equal 2, round.turns.count
    round.take_turn("Dune..?")
    assert_equal 3, round.turns.count
    round.take_turn("Minas Tirith")
    assert_equal 4, round.turns.count
  end

  def test_it_can_count_number_of_correct_guesses_in_given_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Indianapolis")
    round.take_turn("Dune..?")
    round.take_turn("Minas Tirith")

    assert_equal 2, round.number_correct_by_category(:Geography)
    assert_equal 1, round.number_correct_by_category(:SF_Trivia)
  end

  def test_it_can_calculate_percent_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of Indiana?", "Indianapolis", :Geography)
    card3 = Card.new("What is the capital of Arrakis?", "Arrakeen", :SF_Trivia)
    card4 = Card.new("What is the capital of Gondor?", "Minas Tirith", :SF_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Indianapolis")
    round.take_turn("Dune..?")
    round.take_turn("Minas Tirith")

    assert_equal 75.0, round.percent_correct
  end
end
