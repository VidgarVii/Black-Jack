class Dealer < Player
  @validations = Player.validations
  attr_accessor :game

  def initialize
    super('Dealer')
  end

  def first_give_cards
    2.times do
      give_card(:dealer)
      give_card(:player)
    end
  end

  def give_card(player)
    @game.players[player][:hand] << @game.take_card
    @game.score(player)
  end

  def open_cards
    system('clear')
    puts "Карты Дилера #{@game.look_hand(:dialer)}"
    puts "Карты Игрока #{@game.look_hand(:player)}"
    puts "Выйграл #{@game.winner}"
  end
end
