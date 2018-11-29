class Dealer < Player
  @validations = Player.validations
  attr_accessor :game

  def initialize
    super('Dealer')
  end

  def first_give_cards
    2.times do
      give_card('dealers')
      give_card('players')
    end
  end

  def give_card(who)
    card = @game.shoe.give_card
    @game.send("#{who}_hand=", card)
  end

  def take_card(cards)
    @cards = cards
  end
end
