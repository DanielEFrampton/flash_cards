require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_contains_card_instance
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
    assert_instance_of Card, turn.card
  end

  def test_it_can_return_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_correct_method_returns_true_if_guess_same_as_card_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert turn.correct?
  end

  def test_correct_method_returns_false_if_guess_not_same_as_card_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Bluneau", card)

    refute turn.correct?
  end

  def test_feedback_when_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end

  def test_feedback_when_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Bluneau", card)

    assert_equal "Incorrect.", turn.feedback
  end
end
