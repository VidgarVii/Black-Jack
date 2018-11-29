class BlackJack
  include Validation

  attr_reader :players_hand, :dealers_hand, :shoe, :bank

  # Надо переименовать валидотор
  validate :dealer, :nishebrod, 10
  validate :player, :nishebrod, 10

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    validate!
    @bank = 0
    make_a_bet(dealer.place_bet(10))
    make_a_bet(player.place_bet(10))
    @players_hand = []
    @dealers_hand = []
    @shoe = Card.build.shuffle
  end

  def give_card_from_shoe
    card = @shoe[0]
    @shoe.delete(card)
    card
  end

  def make_a_bet(maney)
    @bank += maney
  end

  def players_hand=(card)
    @players_hand << card
  end

  def dealers_hand=(card)
    @dealers_hand << card
  end

  def score(hand)
    check_array = []
    score = 0
    hand.each { |card| check_array << card.value }
    check_array.each do |value|
      score += value.to_i unless value !~ /\d/
      score += 10 unless value !~ /[JQK]/
    end
    score += score > 10 ? 1 : 11 if check_array.include?('A')
    score
  end
end
