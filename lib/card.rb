class Card
  attr_reader :value, :suit

  def self.build
    cards = []
    %w[2 3 4 5 6 7 8 9 10 J Q K A].each do |x|
      cards << Card.new(x, '♣')
      cards << Card.new(x, '♠')
      cards << Card.new(x, '♥')
      cards << Card.new(x, '♦')
    end
    cards
  end

  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end
