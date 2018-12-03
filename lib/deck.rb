class Deck
  def initialize
    @cards = []
    %w[2 3 4 5 6 7 8 9 10 J Q K A].each do |value|
      @cards << Card.new(value, '♣')
      @cards << Card.new(value, '♠')
      @cards << Card.new(value, '♥')
      @cards << Card.new(value, '♦')
    end
    @cards.shuffle!
  end

  def take_card
    @cards.pop
  end  
end
