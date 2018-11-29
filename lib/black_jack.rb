class BlackJack
  include Validation
  attr_reader :players_hand, :dealers_hand
  # Надо переименовать валидотор
  validate :dealer, :nishebrod, 10
  validate :player, :nishebrod, 10

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    @players_hand = []
    @dealers_hand = []
    validate!
    @cards = Cards.new
  end

  def shoe
    @cards
  end

  def bank(maney)
    @bank += maney
  end

  def players_hand=(card)
    @players_hand << card
  end

  def dealers_hand=(card)
    @dealers_hand << card
  end

  def score(hand)
    score = 0
    # костыль
    hand.each do |card|
      val = card.delete(card[-1])
      score += val.to_i unless val !~ /\d/
      score += 10 unless val !~ /[WQK]/
    end

    hand.each do |card|
      val = card.delete(card[-1])
      score += 1 unless val !~ /A/ && score < 10
      #score += 11 unless val !~ /A/ && score >= 10
    end
    p score
  end
end
