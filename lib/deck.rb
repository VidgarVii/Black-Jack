class Deck
  def initialize
    @cards = []
    create_deck
    @cards.shuffle!
  end

  def create_deck
    %w[2 3 4 5 6 7 8 9 10 J Q K A].map do |value|
      %w[♣ ♠ ♦ ♥].map { |suit| @cards << Card.new(value, suit) }
    end
  end

  def take_card
    @cards.pop
  end  
end
