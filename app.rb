require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Pepita")
player2 = Player.new("Pepito")

while player1.life_points > 0 && player2.life_points > 0
  puts
  puts "State of both players :"
  player1.show_state
  player2.show_state
  puts
  puts "Let's fight !"
  puts
  player1.attacks(player2)
  if player2.life_points <=0 then break end
  player2.attacks(player1)
  puts
end

