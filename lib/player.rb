class Player
  include Validation
  attr_accessor :money
  attr_reader :name
  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @hand = Hand.new
    @money = 100
  end

  def place_bet(count)
    @money -= count
    count
  end
end
