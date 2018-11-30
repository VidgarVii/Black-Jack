class Interface
  attr_accessor :player

  def initialize
    puts "♣ ♠ Game BlackJack ♦ ♣\nКак Вас зовут"
    create_player
    welcome
    puts "\nДобро пожаловть #{@player.name}.\n
    Для начало игры нажмите Enter.\n
    Для выхода - 0"
    start = gets.chomp
    return if start == '0'

    @dealer = Dealer.new
    @stutus_game = true # определяет продолжить игру или выйти
    start_game
  end

  def start_game
    @game = BlackJack.new(@dealer, @player)
    @dealer.game = @game
    tracking
  end

  def create_player
    player_name = gets.chomp
    @player = Player.new(player_name)
  rescue StandardError => e
    print e
    retry
  end

  def tracking
    @dealer.first_give_cards
    @shuffle = 0
    loop do
      system('clear')
      puts "Money: #{@game.players[:player][:obj].money}"
      @dealer.give_card(:dealer) if @game.players[:dealer][:score] < 17
      @shuffle += 1
      puts "Shuffle #{@shuffle}"
      print "\nРука Дилера: "
      hide_dealers_hand
      puts "\nСтавка дилера - #{@game.players[:dealer][:bet]} баксов"
      puts_questions
      puts "\n\nСтавка игрока - #{@game.players[:player][:bet]} баксов"
      puts "Очки - #{@game.players[:player][:score]}"
      print "Рука игрока (#{@game.players[:player][:obj].name}): "
      look_hand(:player)
      print "Деньги #{@player.money} $"
      puts "\n Ваш выбор?"
      choice_player

      break if @stutus_game == false
    end
  end

  def choice_player
    choice = gets.chomp
    return @dealer.give_card(:player) if choice == '1'
    return open_cards if choice == '2'

    skip_move!
  rescue StandardError => e
    puts e
    retry
  end

  def puts_questions
    puts "\n\nEnter - Пропустить ход"
    puts '1 - Добавить карту'
    puts '2 - Открыть карты' if @shuffle > 1
  end

  private

  def skip_move!
    raise 'Нельзя пропустить ход' if @game.players[:dealer][:score] >= 17 && @shuffle > 1
  end

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
    return if @shuffle < 2

    system('clear')
    puts 'Карты Дилера'
    look_hand(:dealer)
    puts "Очки: #{@game.players[:dealer][:score]}"
    puts "\nКарты Игрока"
    look_hand(:player)
    puts "Очки: #{@game.players[:player][:score]}"
    puts "\n#{@game.winner}"
    @game.transfer_money
    repeat_game
  end

  def repeat_game
    puts "Еще партию?\n (Y - да)"
    choice = gets.chomp.downcase
    start_game if choice == 'y'

    @stutus_game = false
  end

  def welcome
    system('clear')
    puts '     ____  _            _          _            _
    | __ )| | __ _  ___| | __     | | __ _  ___| | __
    |  _ \| |/ _` |/ __| |/ /  _  | |/ _` |/ __| |/ /
    | |_) | | (_| | (__|   <  | |_| | (_| | (__|   <
    |____/|_|\__,_|\___|_|\_\  \___/ \__,_|\___|_|\_\ '
    puts '                                     play 8-bit music'
  end
end
