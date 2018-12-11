class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def score
    return @value.to_i if @value =~ /\d/
    return 10 if @value =~ /[JQK]/
    return 11 if @value =~ /A/
  end
end
