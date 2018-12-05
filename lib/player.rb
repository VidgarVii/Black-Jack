class Player
  attr_reader :name, :bankroll, :hand

  def initialize(name)
    @name = name
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
