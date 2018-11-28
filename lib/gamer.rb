class Gamer
  include Validation
  attr_reader :name, :score
  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @maney = 100
  end

  def place_bet(count)
    @maney -= count
  end
end
