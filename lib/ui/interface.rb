class Interface
  attr_accessor :player

  def initialize(player, dealer, bank)
    @player = player
    @dealer = dealer
    @bank = bank
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

  def open_cards(resoult)
    system('clear')
    puts 'Карты Дилера'
    look_hand(@dealer)
    puts "Очки: #{@dealer.hand.score}"
    puts "\nКарты Игрока"
    look_hand(@player)
    puts "Очки: #{@player.hand.score}"
    puts "\n#{winner(resoult)}"
  end

  def repeat_game?
    puts "Еще партию?\n (Y - да)"
    choice = gets.chomp.downcase
    choice == 'y'
  end

  def error(error)
    puts error
  end

  def winner(resoult)
    return 'PUSH' if resoult.class == String

    "Выйграл #{resoult.name}"
  end
end
