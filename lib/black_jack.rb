class BlackJack
  def initialize(dealer, gamer)
    @dealer = dealer
    @gamer = gamer
  end

  def start
    dealer.presentation
  end
end
