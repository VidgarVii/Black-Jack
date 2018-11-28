class Cards
  def initialize
    @new_cards = %w[2♣ 2♠ 2♥ 2♦ 3♣ 3♠ 3♥ 3♦ 4♣ 4♠ 4♥ 4♦ 5♣ 5♠ 5♥ 5♦ 6♣ 6♠ 6♥ 6♦
                    7♣ 7♠ 7♥ 7♦ 8♣ 8♠ 8♥ 8♦ 9♣ 9♠ 9♥ 9♦ 10♣ 10♠ 10♥ 10♦ J♣ J♠
                    J♥ J♦ Q♣ Q♠ Q♥ Q♦ K♣ K♠ K♥ K♦ A♣ A♠ A♥ A♦].shuffle
  end

  def give_card
    card = @new_cards.sample
    @new_cards.delete(card)
    card
  end
end
