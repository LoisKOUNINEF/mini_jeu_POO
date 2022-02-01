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
human_player = gets.chomp
human_player = HumanPlayer.new(human_player)

enemies = []
player1 = Player.new("Pepito")
enemies << player1
player2 = Player.new("Pepita")
enemies << player2

while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  #human_player.show_state

  puts "What will you do this turn?"
  puts
  puts "a - Look for a better weapon."
  puts "h - Look for health packs."
  puts
  puts "Attack a player on sight :"
  puts "0 - Attack #{player1.name} with #{player1.life_points} HP."
  puts "1 - Attack #{player2.name} with #{player2.life_points} HP."
  puts

  action = gets.chomp
  if action == "a"
    human_player.search_weapon
  elsif action == "h"
    human_player.search_health_pack
  elsif action == "0"
    human_player.attacks(player1)
  elsif action == "1"
    human_player.attacks(player2)
  end

  puts "Enemies strike back !"
  enemies.each do |player|
    if player.life_points > 0
      player.attacks(human_player)
    else puts "#{player.name} is dead."
    end
  end

end

puts "Fight is over."
if human_player.life_points > 0
  puts "Nailed it. What an amazing fighter !"
else
  puts "You lose."
  puts "Even with 100 HPs, powerful weapons and health packs all around you ?"
  puts "Shame on you."
end
