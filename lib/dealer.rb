class Dealer < Player
  @validations = Player.validations
  attr_accessor :game

  def initialize
    super('Dealer')
  end

  def first_give_cards
    give_card(:dealer)
    2.times do
      give_card(:player)
    end
  end

  def give_card(player)
    @game.players[player][:hand] << @game.take_card
    @game.score(player)
  end
end
