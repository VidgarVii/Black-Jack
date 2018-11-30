class BlackJack
  include Validation

  attr_reader :players_hand, :dealers_hand, :shoe, :bank
  attr_accessor :players
  # Надо переименовать валидотор
  validate :dealer, :nishebrod, 10
  validate :player, :nishebrod, 10

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    validate!
    @players = {
      dealer: { obj: dealer, hand: [], bet: 0, score: 0, status: nil },
      player: { obj: player, hand: [], bet: 0, score: 0, status: nil }
    }
    make_a_bet(:dealer, 10)
    make_a_bet(:player, 10)
    @shoe = Card.build.shuffle
  end

  def make_a_bet(player, maney)
    @players[player][:bet] += @players[player][:obj].place_bet(maney)
  end

  def take_card
    card = @shoe[0]
    @shoe.delete(card)
    card
  end

  def score(player)
    score = @players[player][:score]
    value_last_card = @players[player][:hand][-1].value
    score += value_last_card.to_i unless value_last_card !~ /\d/
    score += 10 unless value_last_card !~ /[JQK]/
    score += score > 10 ? 1 : 11 if value_last_card == 'A'
    @players[player][:score] = score
    @players[player][:status] = 'LOST' if score > 21
    @players[player][:status] = 'WIN' if score == 21
  end

  def winner
    dealer = @players[:dealer][:score]
    player = @players[:player][:score]
    lost = nil
    winner = nil
    lost = 'Player' if player > 21
    lost = 'Dealer' if dealer > 21
    winner = player > dealer ? 'Player WIN' : 'Dealer WIN' if lost.nil?
    winner = 'Draw' if player == dealer
    winner || lost
  end
end
