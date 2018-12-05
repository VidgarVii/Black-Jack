class Interface
  attr_accessor :player

  def initialize(dealer, bank)
    @dealer = dealer
    @bank = bank
    welcome
  end

  def welcome
    puts '     ____  _            _          _            _
  | __ )| | __ _  ___| | __     | | __ _  ___| | __
  |  _ \| |/ _` |/ __| |/ /  _  | |/ _` |/ __| |/ /
  | |_) | | (_| | (__|   <  | |_| | (_| | (__|   <
  |____/|_|\__,_|\___|_|\_\  \___/ \__,_|\___|_|\_\ '
    puts '                                     play 8-bit music'
    puts "♣ ♠ Game BlackJack ♦ ♥\n
  Для начало игры нажмите Enter.\n
  Для выхода - 0"
    start = gets.chomp
    return if start == '0'
  end

  def round(number)
    system('clear')
    print 'Рука дилера '
    hide_dealers_hand
    puts_questions(number)
    puts "\nОчки - #{@player.hand.score}"
    print "Рука игрока (#{@player.name}): "
    look_hand(@player)
    print "Деньги #{@player.bankroll} $"
    puts "\n Ваш выбор?"
  end

  def choice_player
    choice = gets.chomp
  end

  # убрать логику
  def puts_questions(round)
    puts "\n\nEnter - Пропустить ход"
    puts '1 - Добавить карту'
    puts '2 - Открыть карты' if round > 1
  end

  def look_hand(player)
    player.hand.cards.each do |card|
      print "[#{card.value}#{card.suit}] "
    end
  end

  def hide_dealers_hand
    @dealer.hand.cards.size.times do
      print '[*]'
    end
  end

  def open_cards(result)
    system('clear')
    puts 'Карты Дилера'
    look_hand(@dealer)
    puts "Очки: #{@dealer.hand.score}"
    puts "\nКарты Игрока"
    look_hand(@player)
    puts "Очки: #{@player.hand.score}"
    puts "\n#{winner(result)}"
  end

  def repeat_game?
    puts "Еще партию?\n (Y - да)"
    choice = gets.chomp.downcase
    choice == 'y'
  end

  def error(error)
    puts error
  end

  def winner(result)
    return 'PUSH' if result.class == String

    "Выйграл #{result.name}"
  end

  def create_player
    puts 'Введите свое имя'
    gets.chomp
  end

  def game_over
    puts 'Игра окнчена.'
  end
end
