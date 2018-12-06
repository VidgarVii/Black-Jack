class Player
  attr_reader :name, :bankroll

  def initialize(name)
    name = 'Gamer' if name.empty?
    @name = name
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
