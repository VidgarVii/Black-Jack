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
    @stutus_game = true
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
    @dealer.first_give_cards
    loop do
      dealer_cards = @game.players[:dealer][:hand].size
      player_cards = @game.players[:player][:hand].size
      system('clear')
      print "\nРука Дилера: "
      hide_dealers_hand
      puts "\nСтавка дилера - #{@game.players[:dealer][:bet]} баксов"
      puts_questions
      puts "\n\nСтавка игрока - #{@game.players[:player][:bet]} баксов"
      puts "Очки - #{@game.players[:player][:score]}"
      print 'Рука игрока: '
      look_hand(:player)
      choice_player

      break if @stutus_game == false
    end
  end

  # Продумать исключения полученных данных
  def choice_player
    puts "\n Ваш выбор?"
    choice = gets.chomp

    @dealer.give_card(:dealer) if @game.players[:dealer][:score] < 17
    @dealer.give_card(:player) if choice == '2'
    open_cards if choice == '3'
  end

  def puts_questions
    puts "\n\n1 - Пропустить ход"
    puts '2 - Добавить карту'
    puts '3 - Открыть карты' if @game.players[:player][:hand].size > 2
  end

  # Нужен метод который будем спрашивать что делать дальше
  # Нужен метод с loop для tracking  
  private

  def look_hand(player)
    @game.players[player][:hand].each do |card|
      print "[#{card.value}#{card.suit}] "
    end
  end

  def hide_dealers_hand
    @game.players[:dealer][:hand].size.times do
      print '[*]'
    end
  end

  def open_cards
    return if @game.players[:player][:hand].size == 2

    @stutus_game = false
    system('clear')
    puts 'Карты Дилера'
    look_hand(:dealer)
    puts "\nКарты Игрока"
    look_hand(:player)
    puts "\n#{@game.winner}"
  end
end
