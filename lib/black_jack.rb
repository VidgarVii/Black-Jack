class BlackJack
  def initialize(player)
    @player = player
    @dealer = Dealer.new
    @bank = Bank.new
  end

  def start
    return bets if bets.class == RuntimeError

    2.times do
      @dealer.give_card(@player)
      @dealer.give_card(@dealer)
    end
    p @dealer.hand
    p @player.hand
  end

  private

  def bets
    @bank.place_bet(@player)
    @bank.place_bet(@dealer)
  rescue StandardError => e
    e
  end
end
