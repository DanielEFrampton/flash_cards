require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class FlashcardRunner
  attr_reader :round

  def initialize
    card_generator = CardGenerator.new('./data/cards.txt')
    deck = Deck.new(card_generator.cards)
    @round = Round.new(deck)
  end

  # Main CLI execution block
  def start
    # Introductory blurb
    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts '-------------------------------------------------'
    # Question-and-feedback loop
    while (round.turns.size + 1) <= round.deck.count
      puts "This is card number #{round.turns.size + 1} out of #{round.deck.count}."
      puts "Question: #{round.current_card.question}"
      round.take_turn(gets.chomp)
      puts round.turns.last.feedback
    end
    # End of game report
    puts '****** Game over! ******'
    puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.round}."
    # Loop to print percent_correct_by_category for each category present in deck
    round.deck.cards.map {|card| card.category }.uniq.each do |category|
      puts "#{category} - #{round.percent_correct_by_category(category).round}%"
    end
  end
end

# Instantiating the runner and invoking the CLI method
game = FlashcardRunner.new
game.start
