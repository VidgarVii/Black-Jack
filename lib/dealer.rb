class Dealer < Player
  def initialize
    super('Dealer')
    @shoe = Deck.new
  end

  def give_card(player)
    return if player == self && player.hand.score > 17

    player.hand.add_card(@shoe.take_card)
  end
end
