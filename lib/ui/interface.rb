class Interface
  attr_accessor :player, :dealer, :bank
  attr_reader :stop_game

  def initialize
    @stop_game = false
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
    @stop_game = true if start == '0'
  end

  def round(number)
    system('clear')
    print "Рука дилера"
    hide_dealers_hand
    puts_questions(number)
    puts "\n Банк #{@bank}"
    print "Рука игрока (#{@player.name}): "
    look_hand(@player.hand.cards)
    puts "Ваши деньги #{@player.bankroll}"
    puts "\n Ваш выбор?"
  end

  def choice_player
    gets.chomp
  end

  def puts_questions(round)
    print "\n1 - Добавить карту" if @player.hand.cards.size < 3
    print "\n2 - Открыть карты" if round > 1
    puts "\nEnter - Пропустить ход\n" if round < 2
  end

  def look_hand(hand)
    hand.each do |card|
      print "[#{card.value}#{card.suit}] "
    end
  end

  def hide_dealers_hand
    @dealer.hand.cards.size.times do
      print '[*]'
    end
  end

  def open_cards(result, dealer_score, player_score)
    system('clear')
    puts 'Карты Дилера'
    look_hand(@dealer.hand.cards)
    puts "Очки: #{dealer_score}"
    puts "\nКарты Игрока"
    look_hand(@player.hand.cards)
    puts "Очки: #{player_score}"
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
    "Выйграл #{result}"
  end

  def create_player
    puts 'Введите свое имя'
    gets.chomp
  end

  def game_over
    puts 'Игра окнчена.'
  end
end
