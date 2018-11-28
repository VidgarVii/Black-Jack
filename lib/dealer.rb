class Dealer < Gamer
  @validations = Gamer::validations
  def initialize
    super('Dealer')
  end

  def give_card
    @cards.give_card
  end

  # Выдать колоду дилеру
  def take_cards(cards)
    @cards = cards
  end

  
end
