class Interface
  attr_accessor :player

  def initialize
    puts "♣ ♠ Game BlackJack ♦ ♣\nКак Вас зовут"
    create_player
    puts "Добро пожаловть #{@player.name}.\n
    Для начало игры нажмите Enter.\n
    Для выхода - 0"
    start = gets.chomp
    return if start == '0'

    @dealer = Dealer.new
    @game = BlackJack.new(@dealer, @player)
    @dealer.game = @game
    tracking
  end

  def create_player
    player_name = gets.chomp
    @player = Player.new(player_name)
  rescue StandardError => e
    puts e
    retry
  end

  def tracking
    system('clear')
    @dealer.first_give_cards
    puts "В банке #{@game.bank} денег"
    print "\nРука Дилера: "
    hide_dealers_hand

    p @game.player_win?

    puts "\n\n\n Actions \n\n"

    p @game.score(@game.players_hand)
    print "\nРука игрока: "
    look_players_hand
  end

  # Нужен метод который будем спрашивать что делать дальше
  # Нужен метод с loop для tracking

  private

  def look_players_hand
    @game.players_hand.each do |card|
      print "[#{card.value}#{card.suit}] "
    end
  end

  def hide_dealers_hand
    @game.dealers_hand.size.times do
      print '[*]'
    end
  end
end
