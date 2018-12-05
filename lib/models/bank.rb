class Bank
  attr_reader :bank

  def initialize
    @bank = 0
    @players = []
  end

  def place_bet(player)
    @bank += player.take_money(10)
    @players << player
  end

  def return_money
    @players.reject! { |player| player.give_money(10) }
  end

  def transfer_money_to_winner(winner)
    winner.give_money(@bank)
  end
end
