class Bank
 
  def initialize
    @bank = 0
    @bets = []
  end

  def place_bet(player, money)
    
  end

  def return_money   
 
  end

  def transfer_money_to_winner(winner)
    winner.give_money(@bank)
  end

  private

  def check_money!
    raise 'Недостаточно средств' player.money < 10
  end
end
