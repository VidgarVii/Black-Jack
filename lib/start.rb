class StartGame
  attr_accessor :gamer

  def initialize
    puts "♣ ♠ Game BlackJack ♦ ♣\nКак Вас зовут"
    create_gamer
    puts "Добро пожаловть #{@gamer.name}.\n
    Для начало игры нажмите Enter.\n
    Для выхода - 0"
    start = gets.chomp
    return if start == '0'

    dealer = Dealer.new
    @game = BlackJack.new(dealer, @gamer)
  end

  def create_gamer
    gamer_name = gets.chomp
    @gamer = Gamer.new(gamer_name)
  rescue StandardError => e
    puts e
    retry
  end
end
