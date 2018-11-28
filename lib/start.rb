puts '♣ ♠ Game BlackJack ♦ ♣'
puts 'Как Вас зовут'
gamer_name = gets.chomp
puts "Добро пожаловть #{gamer_name}.\n
Для начало игры нажмите Enter.\n
Для выхода - 0"
start = gets.chomp
return if start == '0'

dealer = Dealer.new
gamer = Gamer.new(gamer_name)
@game = BlackJack.new(dealer, gamer)
