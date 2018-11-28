puts '♣ ♠ Game BlackJack ♦ ♣'
puts 'Как Вас зовут'
begin
  gamer_name = gets.chomp
  gamer = Gamer.new(gamer_name)
rescue StandardError => e
  puts e
  retry
end
puts "Добро пожаловть #{gamer_name}.\n
Для начало игры нажмите Enter.\n
Для выхода - 0"
start = gets.chomp
return if start == '0'

dealer = Dealer.new
@game = BlackJack.new(dealer, gamer)
