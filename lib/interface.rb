class Interface
  attr_accessor :player

  def initialize(game)
    @game = game
  end

  def shuffle(shuffle)
    system('clear')
    puts "Shuffle #{shuffle}"
    print "\nРука Дилера: "
    hide_dealers_hand
    puts "\nСтавка дилера - #{@game.players[:dealer][:bet]} баксов"
    puts_questions(shuffle)
    puts "\n\nСтавка игрока - #{@game.players[:player][:bet]} баксов"
    puts "Очки - #{@game.players[:player][:score]}"
    print "Рука игрока (#{@game.players[:player][:obj].name}): "
    look_hand(:player)
    print "Деньги #{@game.players[:player][:obj].money} $"
    puts "\n Ваш выбор?"
  end

  def choice_player
    choice = gets.chomp
  end

  # убрать логику
  def puts_questions(shuffle)
    puts "\n\nEnter - Пропустить ход"
    puts '1 - Добавить карту'
    puts '2 - Открыть карты' if shuffle > 1
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
    system('clear')
    puts 'Карты Дилера'
    look_hand(:dealer)
    puts "Очки: #{@game.players[:dealer][:score]}"
    puts "\nКарты Игрока"
    look_hand(:player)
    puts "Очки: #{@game.players[:player][:score]}"
    puts "\n#{@game.winner}"
  end

  def repeat_game?
    puts "Еще партию?\n (Y - да)"
    choice = gets.chomp.downcase
    choice == 'y'
  end
end
