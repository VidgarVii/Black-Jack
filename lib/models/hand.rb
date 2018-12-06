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

    @bust = true if @score > 21
  end
end
