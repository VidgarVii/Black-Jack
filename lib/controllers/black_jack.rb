class BlackJack
  def initialize
    @interface = Interface.new
    return if @interface.stop_game

    create_player
    start
  end

  def create_player
    @player = Player.new(@interface.create_player)
    @interface.player = @player
  end

  def start
    @dealer = Player.new('Dealer')
    @interface.dealer = @dealer
    loop do
      @deck = Deck.new
      @bank = 0
      bets
      @interface.bank = @bank
      round
      break unless repeat_game?
    end
  end

  def round
    @round = 1
    @dealer.hand.add_card(@deck.take_card)
    2.times { @player.hand.add_card(@deck.take_card) }
    loop do
      @dealer.hand.add_card(@deck.take_card)
      @interface.round(@round)
      action_player
      break if @round == 2

      @round += 1
    end
    open_cards
  end

  def bets
    @bank = 20
    @player.bankroll -= 10
    @dealer.bankroll -= 10
  end

  def action_player
    choice = @interface.choice_player
    case choice
    when '1' then @player.hand.add_card(@deck.take_card) if @player.hand.cards.size < 3
    when '2' then return
    end
  end

  def open_cards
    return if @round < 2

    @player.hand.calc_score
    @dealer.hand.calc_score
    @result = result
    @interface.open_cards(@result, @dealer.hand.score, @player.hand.score)
    transfer_money
  end

  def result
    return @player.name if @player.hand.score == 21
    return 'Dealer' if @player.hand.score > 21
    return 'PUSH' if @player.hand.score == @dealer.hand.score
    return @player.name if @player.hand.score < 21 &&  @dealer.hand.score > 21

    @dealer.hand.score < @player.hand.score ? @player.name : 'Dealer'
  end

  def transfer_money
    case @result
    when 'Dealer' then @dealer.bankroll += @bank
    when 'PUSH'
      @player.bankroll += 10
      @dealer.bankroll += 10
    when @player.name then @player.bankroll += 20
    end
  end

  def repeat_game?
    return false if @player.bankroll < 10 || @dealer.bankroll < 10

    if @interface.repeat_game?
      @player.hand.drop
      @dealer.hand.drop
      true
    else
      false
    end
  end
end
