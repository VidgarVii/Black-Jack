class Dealer < Player
  @validations = Player.validations
  # ACTIONS = { '1' => 'give_card(:player)', '2' => 'open_cards' }.freeze

  def initialize
    super('Dealer')
  end

  def first_give_cards
    give_card(:dealer)
    2.times do
      give_card(:player)
    end
  end

  def give_card(player)
    @game.players[player][:hand] << @game.take_card
    @game.score(player)
  end

  def start_game(player)
    @player = player
    @game = BlackJack.new(self, player)
    @interface = Interface.new(@game)
    @stutus_game = true
    first_give_cards
    tracking
  end

  private

  def tracking
    @shuffle = 0
    loop do
      give_card(:dealer) if @game.players[:dealer][:score] < 17
      @shuffle += 1
      @interface.shuffle(@shuffle)
      action_player
      break if @stutus_game == false
    end
  end

  def action_player
    choice = @interface.choice_player
    case choice
    when '1' then give_card(:player)
    when '2' then open_cards
    else skip_move!
    end
  rescue StandardError => e
    e
    retry
  end

  def skip_move!
    raise 'Нельзя пропустить ход' if @game.players[:dealer][:score] >= 17 && @shuffle > 1
  end

  def open_cards
    return if @shuffle < 2

    @interface.open_cards
    @game.transfer_money
    @stutus_game = false
    start_game(@player) if @interface.repeat_game?
  end
end
