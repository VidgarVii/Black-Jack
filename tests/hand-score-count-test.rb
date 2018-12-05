require 'test/unit'
require_relative '../lib/models/hand'
require_relative '../lib/models/card'

# Проверка подсчет очков карт, когда приходят или уже есть в руке тузы

class Tests < Test::Unit::TestCase
  def setup
    @ace = Card.new('A', '♥')
    @two = Card.new('2', '♥')
    @king = Card.new('K', '♥')
    @five = Card.new('5', '♥')
  end

  def test_calc_score_1
    hand = Hand.new
    hand.add_card(@ace)
    hand.add_card(@king)
    hand.add_card(@five)
    assert_equal(hand.score, 16)
  end

  def test_calc_score_2
    hand = Hand.new    
    hand.add_card(@king)
    hand.add_card(@ace)
    hand.add_card(@five)
    assert_equal(hand.score, 16)
  end

  def test_calc_score_3
    hand = Hand.new
    hand.add_card(@five)
    hand.add_card(@king)
    hand.add_card(@ace)    
    assert_equal(hand.score, 16)
  end

  def test_calc_score_4
    hand = Hand.new
    hand.add_card(@five)
    hand.add_card(@king)
    hand.add_card(@ace)
    hand.add_card(@five)   
    assert_equal(hand.score, 21)
  end

  def test_calc_score_5
    hand = Hand.new
    hand.add_card(@five)
    hand.add_card(@ace)
    hand.add_card(@king)    
    hand.add_card(@five)   
    assert_equal(hand.score, 21)
  end

  def test_calc_score_6
    hand = Hand.new
    hand.add_card(@two)
    hand.add_card(@ace)
    hand.add_card(@king)    
    hand.add_card(@five)   
    assert_equal(hand.score, 18)
  end

  def test_calc_score_7
    hand = Hand.new
    hand.add_card(@two)
    hand.add_card(@ace)
    hand.add_card(@ace)
    hand.add_card(@king)   
    hand.add_card(@five)
    assert_equal(hand.score, 19)
  end

  def test_calc_score_8
    hand = Hand.new
    hand.add_card(@two)
    hand.add_card(@ace)
    hand.add_card(@ace)
    hand.add_card(@ace)
    hand.add_card(@king)    
    hand.add_card(@five)   
    assert_equal(hand.score, 20)
  end

  def test_calc_score_9
    hand = Hand.new
    hand.add_card(@ace)
    hand.add_card(@ace)
    hand.add_card(@ace)
    assert_equal(hand.score, 13)
  end

  def test_calc_score_10
    hand = Hand.new
    hand.add_card(@king)
    hand.add_card(@ace)
    hand.add_card(@ace)
    hand.add_card(@ace)
    assert_equal(hand.score, 13)
  end

  def test_calc_score_11
    hand = Hand.new
    hand.add_card(@king)
    hand.add_card(@ace)
    hand.add_card(@two)
    hand.add_card(@ace)
    hand.add_card(@ace)
    assert_equal(hand.score, 15)
  end

  def test_calc_score_12
    hand = Hand.new
    hand.add_card(@five)
    hand.add_card(@ace)
    hand.add_card(@two)
    hand.add_card(@ace)
    hand.add_card(@ace)
    assert_equal(hand.score, 20)
  end
end
