class BlackJack
  def initialize
    create_player
    @dealer_hand = []
    @dealer_bank = 100
    @player_bank = 100
    @bank = 0
    @interface = Interface.new(@dealer)
  end

  def create_player
    @player = Player.new(@interface.create_player)
    @interface.player = @player
  end

  def start
    loop do
      @shoe = Deck.new
      @interface.bank = @bank
      bets
      round
      break unless repeat_game?
    end
  end

  def round
    @round = 1
    2.times { give_cards }
    loop do
      @interface.round(@round)
      action_player
      break if @round == 'stop'

      @round += 1
    end
  end

  private

  def give_cards
    @dealer.give_card(@player)
    @dealer.give_card(@dealer)
  end

  def action_player
    choice = @interface.choice_player
    case choice
    when '1' then give_cards
    when '2' then open_cards
    else @dealer.give_card(@dealer)
    end
  end

  def open_cards
    return if @round < 2

    @round = 'stop'
    result = result_game
    @interface.open_cards(result)
    return @bank.return_money if result == 'PUSH'

    @bank.transfer_money_to_winner(result)
  end

  def bets
    @bank.place_bet(@player) if @player.bankroll >= 10
    @bank.place_bet(@dealer) if @dealer.bankroll >= 10
  end

  def result_game
    return 'PUSH' if @dealer.hand.score == @player.hand.score
    return 'PUSH' if @player.hand.bust && @dealer.hand.bust
    return @player if @dealer.hand.bust
    return @dealer if @player.hand.bust

    unless @player.hand.bust && @dealer.hand.bust
      @dealer.hand.score > @player.hand.score ? @dealer : @player
    end
  end

  def repeat_game?
    return false if @player.bankroll < 10

    if @interface.repeat_game?
      @dealer.hand.clear
      @player.hand.clear
      true
    else
      false
    end
  end
end
