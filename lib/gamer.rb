class Player
  include Validation
  attr_accessor :maney
  attr_reader :name
  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @maney = 100
  end

  def place_bet(count)
    @maney -= count
    count
  end
end
