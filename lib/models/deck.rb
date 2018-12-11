class Deck

  SUITS = %w[♣ ♠ ♦ ♥].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize
    @cards = []
    create_deck
    @cards.shuffle!
  end

  def create_deck
    VALUES.each do |value|
      SUITS.each { |suit| @cards << Card.new(value, suit) }
    end
  end

  def take_card
    @cards.pop
  end
end
