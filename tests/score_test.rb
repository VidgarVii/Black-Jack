require 'test/unit'
require_relative '../lib/models/card'
require_relative '../lib/models/player'
require_relative '../lib/controllers/black_jack'
require_relative '../lib/ui/interface'

# Перед запуском закоммитить 4 и 5 строку в классе BlackJack

class ScoreTest < Test::Unit::TestCase
  def setup
    @game = BlackJack.new
    player = Player.new('Gamer')
    @a = Card.new('A', '+')
    @k = Card.new('K', '+')
    @two = Card.new('2', '+')
    @game.instance_variable_set(:@player, player)
    @game.instance_variable_set(:@dealer_hand, [@two, @k, @a])
  end
  
  def test_score_0
    array = [@two, @k, @a]
    @game.instance_variable_set(:@player_hand, array)
    @game.score
    res = @game.instance_variable_get(:@player_score)
    assert_equal(res, 13)
  end

  def test_score_1
    array = [@k, @a, @two]
    @game.instance_variable_set(:@player_hand, array)
    @game.score
    res = @game.instance_variable_get(:@player_score)
    assert_equal(res, 13)
  end

  def test_score_2
    array = [@a, @two, @k]
    @game.instance_variable_set(:@player_hand, array)
    @game.score
    res = @game.instance_variable_get(:@player_score)
    assert_equal(res, 13)
  end
end
