require_relative 'lib/modules/validations'
require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/hand'
require_relative 'lib/player'
require_relative 'lib/dealer'
require_relative 'lib/bank'
require_relative 'lib/black_jack'
require_relative 'lib/ui/interface'

game = BlackJack.new
game.start
