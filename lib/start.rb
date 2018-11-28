class StartGame
  attr_accessor :player

  def initialize
    puts "♣ ♠ Game BlackJack ♦ ♣\nКак Вас зовут"
    create_player
    puts "Добро пожаловть #{@player.name}.\n
    Для начало игры нажмите Enter.\n
    Для выхода - 0"
    start = gets.chomp
    return if start == '0'

    dealer = Dealer.new
    @game = BlackJack.new(dealer, @player)
  end

  def create_player
    player_name = gets.chomp
    @player = Player.new(player_name)
  rescue StandardError => e
    puts e
    retry
  end
end
