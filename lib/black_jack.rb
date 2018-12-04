class BlackJack
  # Bust - перебор очков Hit - еще

  def initialize(player)
    @player = player
    @dealer = Dealer.new
    @bank = Bank.new
    @interface = Interface.new(@player, @dealer, @bank)
  end

  def start
    return bets if bets.class == RuntimeError

    @round = 1
    2.times { give_cards }
    loop do
      @interface.round(@round)
      begin
        action_player
      rescue StandardError => e
        @interface.error(e)
        retry
      end
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
    else
      skip_move!
      @dealer.give_card(@dealer)
    end
  end

  def open_cards
    return if @round < 2

    @round = 'stop'

    @interface.open_cards(resoult_game)
    # bank.transfer_money
  end

  def bets
    @bank.place_bet(@player)
    @bank.place_bet(@dealer)
  rescue StandardError => e
    e
  end

  def skip_move!
    raise 'Нельзя пропустить ход' if @dealer.hand.score >= 17 && @round > 1
  end

  def resoult_game
    return 'PUSH' if @dealer.hand.score == @player.hand.score
    return 'PUSH' if @player.hand.bust && @dealer.hand.bust
    return @player if @dealer.hand.bust
    return @dealer if @player.hand.bust

    unless @player.hand.bust && @dealer.hand.bust
      @dealer.hand.score > @player.hand.score ? @dealer : @player
    end
  end
end
