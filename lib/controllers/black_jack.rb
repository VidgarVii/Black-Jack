class BlackJack
  def initialize
    @dealer_bank = 100
    @interface = Interface.new
    create_player
  end

  def create_player
    @player = Player.new(@interface.create_player)
    @interface.player = @player
  end

  def start
    loop do
      @dealer_hand = []
      @player_hand = []
      @deck = Deck.new
      @bank = 0
      bets
      @interface.bank = @bank
      @interface.player_hand = @player_hand
      @interface.dealer_hand = @dealer_hand
      round
      break unless repeat_game?
    end
  end

  def round
    @round = 1
    @dealer_hand << @deck.take_card
    2.times { @player_hand << @deck.take_card }
    loop do
      @dealer_hand << @deck.take_card
      @interface.round(@round)
      action_player
      break if @round == 2

      @round += 1
    end
    open_cards
  end

  def bets
    @bank = 20
    @player.bankroll -= 10
    @dealer_bank -= 10
  end

  def score
    @player_score = 0
    @dealer_score = 0
    @player_hand.each { |card| @player_score += card.score}
    @dealer_hand.each { |card| @dealer_score += card.score}
    @player_hand.select { |card| card.value =~ /A/ }.each { @player_score -= 10 if @player_score > 21 }
    @dealer_hand.select { |card| card.value =~ /A/ }.each { @dealer_score -= 10 if @dealer_score > 21 }
  end

  def action_player
    choice = @interface.choice_player
    case choice
    when '1' then @player_hand << @deck.take_card if @player_hand.size < 3
    when '2' then open_cards
    end
  end

  def open_cards
    return if @round < 2

    score
    @result = result
    @interface.open_cards(@result, @dealer_score, @player_score)
    transfer_money
  end

  def result
    return @player.name if @player_score == 21
    return 'Dealer' if @player_score > 21
    return 'PUSH' if @player_score == @dealer_score
    return @player.name if @player_score < 21 &&  @dealer_score > 21

    @dealer_score < @player_score ? @player.name : 'Dealer'
  end

  def transfer_money
    case @result
    when 'Dealer' then @dealer_bank += @bank
    when 'PUSH'
      @player.bankroll += 10
      @dealer_bank += 10
    when @player.name then @player.bankroll += 20
    end
  end

  def repeat_game?
    return false if @player.bankroll < 10 || @dealer_bank < 10

    if @interface.repeat_game?
      true
    else
      false
    end
  end
end
