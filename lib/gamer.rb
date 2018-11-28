class Gamer
  attr_reader :name

  def initialize(name)
    @name = name
    @score = 100
  end

  def place_bet(count)
    @score -= count
  end
end
