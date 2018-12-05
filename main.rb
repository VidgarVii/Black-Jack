require_relative 'lib/models/card'
require_relative 'lib/models/deck'
require_relative 'lib/models/hand'
require_relative 'lib/models/player'
require_relative 'lib/models/dealer'
require_relative 'lib/models/bank'
require_relative 'lib/controllers/black_jack'
require_relative 'lib/ui/interface'

game = BlackJack.new
game.start
