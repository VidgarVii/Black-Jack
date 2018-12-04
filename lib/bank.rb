class Bank

  def initialize
    @bank = 0
    @players = []
  end

  def place_bet(player) 
    check_money!(player)
    @bank += player.take_money(10)
    @players << player
  end

  def return_money
    @players.each { |player| player.give_money(10) }
    @bank = 0
  end

  def transfer_money_to_winner(winner)
    winner.give_money(@bank)
  end

  private

  def check_money!(player)
    raise 'Недостаточно средств. Игра окончена' if player.bankroll < 10
  end
end
