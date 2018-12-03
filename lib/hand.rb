class Hand
  attr_reader :score

  def initialize
    @cards = []
    @score = 0
  end

  def puts_card(card)
    @cards << card
    calc_score
  end

  private

  def calc_score
    
  end

  #Подсчет тузов
end
