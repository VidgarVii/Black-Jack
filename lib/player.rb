class Player
  include Validation
  attr_reader :name, :bankroll, :hand
  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @hand = Hand.new
    @bankroll = 100
  end

  def take_money(count)
    @bankroll -= count
    count
  end

  def give_money(money)
    @bankroll += money
  end
end
