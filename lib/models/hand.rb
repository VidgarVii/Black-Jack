class Hand
  attr_reader :score, :cards, :bust

  def initialize
    @cards = []
    @score = 0
    @bust = false
  end

  def add_card(card)
    @cards << card
    calc_score(card)
  end

  def clear
    @score = 0
    @cards = []
    @bust = false
  end

  private

  def calc_score(card)
    @score += card.value.to_i unless card.value !~ /\d/
    @score += 10 unless card.value !~ /[JQK]/
    @score += @score <= 10 ? 11 : 1 if card.value == 'A'
    @score = polimorph_ace if @score > 21 && @cards.find { |card| card.value == 'A' }
    @bust = true if @score > 21
  end

  def polimorph_ace
    score = 0
    @cards.each do |card| 
      score += card.value.to_i unless card.value !~ /\d/
      score += 10 unless card.value !~ /[JQK]/
    end
    @cards.each do |card|
      score += @score <= 10 ? 11 : 1 if card.value == 'A'
    end
    @score = score
  end
end

