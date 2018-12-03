module Game
  def self.start
    puts "♣ ♠ Game BlackJack ♦ ♣\nКак Вас зовут"
    create_player
    puts "\nДобро пожаловть #{@player.name}.\n
    Для начало игры нажмите Enter.\n
    Для выхода - 0"
    start = gets.chomp
    return if start == '0'

    @dealer = Dealer.new
    @stutus_game = true # определяет продолжить игру или выйти
    @dealer.start_game(@player)
  end

  private

  def self.create_player
    player_name = gets.chomp
    @player = Player.new(player_name)
  rescue StandardError => e
    print e
    retry
  end
end
