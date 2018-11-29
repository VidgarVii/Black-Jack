class BlackJack
  include Validation
  # Надо переименовать валидотор
  validate :dealer, :nishebrod, 10
  validate :player, :nishebrod, 10

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    validate!
    @cards = Cards.new
  end

  def shoe
    @cards
  end

  def bank(maney)
    @bank += maney
  end

  def players_hand(card)
    @players_hand ||= []
    @players_hand << card
  end

  def dealers_hand(card)
    @dealers_hand ||= []
    @dealers_hand << card
  end

  def score
    # Подсчет текущих очков
  end
end
