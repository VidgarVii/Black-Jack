class Gamer
  include Validation
  attr_reader :name, :score
  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @score = 100
  end

  def place_bet(count)
    @score -= count
  end
end
