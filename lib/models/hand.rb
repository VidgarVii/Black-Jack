class Hand
  attr_reader :cards, :score

  def initialize
    @cards = []
    @score = 0
  end

  def add_card(card)
    @cards << card
  end

  def calc_score
    @cards.each { |card| @score += card.score }
    @cards.select { |card| card.value =~ /A/ }.each { @score -= 10 if @score > 21 }
  end
end
