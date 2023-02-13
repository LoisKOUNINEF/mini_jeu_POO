require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/inputs'

input = Inputs.new
game = Game.new
game.show_players(input.enemies)