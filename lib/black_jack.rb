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
    # sign_in()?
    @players = {
      dealer: { obj: dealer, hand: [], bet: 0, score: 0, status: 'dealer' },
      player: { obj: player, hand: [], bet: 0, score: 0, status: 'player' }
    }
    make_a_bet(:dealer, 10)
    make_a_bet(:player, 10)
    @shoe = Card.build.shuffle
  end

  def make_a_bet(player, money)
    @players[player][:bet] += @players[player][:obj].place_bet(money)
  end

  def take_card
    card = @shoe[0]
    @shoe.delete(card)
    card
  end

  #Если туз пришел в начале он не иправляется на 1 очко
  def score(player)
    score = @players[player][:score]
    val_last_card = @players[player][:hand][-1].value
    score += val_last_card.to_i unless val_last_card !~ /\d/
    score += 10 unless val_last_card !~ /[JQK]/
    score += score > 10 ? 1 : 11 if val_last_card == 'A'
    @players[player][:score] = score
    @players[player][:status] = 'LOST' if score > 21
    @players[player][:status] = 'WIN' if score == 21
  end

  def winner
    score_dealer = @players[:dealer][:score]
    score_player = @players[:player][:score]
    status_dealer = @players[:dealer][:status]
    status_player = @players[:player][:status]
    return 'DRAW' if score_dealer == score_player || status_dealer == status_player
    return @winner = 'Player WIN' if status_dealer == 'LOST'
    return @winner = 'Dealer WIN' if status_player == 'LOST'

    @winner = score_player > score_dealer ? 'Player WIN' : 'Dealer WIN'
    @winner
  end

  # Зачем дилеру перекидывать деньги?
  # И тут не работает winner underfine method[]
  def transfer_money
    winner = @winner.tr(' WIN', '')
    @player[winner][:obj].money += @players[:dealer][:bet] + @players[:player][:bet]
  end
end
