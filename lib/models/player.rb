class Player
  attr_accessor :bankroll
  attr_reader :name

  def initialize(name)
    name = 'Gamer' if name.empty?
    @name = name
    @bankroll = 100
  end
end
