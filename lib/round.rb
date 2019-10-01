class Round
  attr_accessor :turns, :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    self.turns << Turn.new(guess, current_card)
    self.deck.cards.rotate!(1)
    turns.last
  end

  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    turns.count do |turn|
      turn.correct? && category == turn.card.category
    end
  end
  
end
