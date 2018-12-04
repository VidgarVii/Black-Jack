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


  #  def open,close; end (для дилера)
  
  # метод для вскрытия карт (показ всех карт для обоих играков)

  private

  def calc_score(card)
    @score += card.value.to_i unless card.value !~ /\d/
    @score += 10 unless card.value !~ /[JQK]/
    @score += @score <= 10 ? 11 : 1 if card.value == 'A'
    @score = polimorph_ace if @score > 21 && @cards.size <= 3
    @bust = true if @score > 21
  end

  def polimorph_ace
    check_ace ||= false
    return if check_ace == true

    @cards.each { |card| @score -= 10 if card.value == 'A' }
    check_ace = true
    @score
  end
end
