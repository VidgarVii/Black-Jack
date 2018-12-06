require 'test/unit'
require_relative '../lib/models/player'
require_relative '../lib/controllers/black_jack'
require_relative '../lib/ui/interface'

class WinnerTest < Test::Unit::TestCase
  def setup
    @game = BlackJack.new
    player = Player.new('Gamer')
    @game.instance_variable_set(:@player, player)
  end
  
  def test_win_gamer
    @game.instance_variable_set(:@player_score, 21)
    @game.instance_variable_set(:@dealer_score, 2)
    assert_equal(@game.result, 'Gamer')
  end

  def test_win_dealer
    @game.instance_variable_set(:@player_score, 2)
    @game.instance_variable_set(:@dealer_score, 20)
    assert_equal(@game.result, 'Dealer')
  end

  def test_win_push
    @game.instance_variable_set(:@player_score, 20)
    @game.instance_variable_set(:@dealer_score, 20)
    assert_equal(@game.result, 'PUSH')
  end

  def test_win_gamer_1
    @game.instance_variable_set(:@player_score, 20)
    @game.instance_variable_set(:@dealer_score, 2)
    assert_equal(@game.result, 'Gamer')
  end

  def test_win_dealer_1
    @game.instance_variable_set(:@player_score, 22)
    @game.instance_variable_set(:@dealer_score, 2)
    assert_equal(@game.result, 'Dealer')
  end

  def test_win_gamer_2
    @game.instance_variable_set(:@player_score, 20)
    @game.instance_variable_set(:@dealer_score, 25)
    assert_equal(@game.result, 'Gamer')
  end
end
