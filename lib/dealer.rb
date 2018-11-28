class Dealer < Gamer
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

  def presentation(gamer)
    puts "Здравствуйте #{gamer.name}. Я ваш Дилер"
  end
end
