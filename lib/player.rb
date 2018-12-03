class Player
  include Validation
  attr_reader :name, :money
  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @hand = Hand.new
    @money = 100
  end

  def take_money(count)
    @money -= count
    count
  end

  def give_money(money)
    @money += money    
  end  
end
