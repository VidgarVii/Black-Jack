class Dealer < Player
  @validations = Player.validations

  def initialize
    super('Dealer')
  end

  def give_card(player)
    return if player == self && hand.score >= 17

    player.hand.add_card << @shoe.take_card
  end
end
