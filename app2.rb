require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "#"*40
puts "| Welcome in my 101 fighting game ! |"
puts "| Last player standing wins !       |"
puts "#"*40

puts "Let's create your own fighter."
puts "What's your fighter's name ?"
print ">"
human_player_name = gets.chomp
human_player = HumanPlayer.new(user_name)
human_player.show_state

enemies = []
player1 = Player.new("Pepito")
enemies << player1
player2 = Player.new("Pepita")
enemies << player2
