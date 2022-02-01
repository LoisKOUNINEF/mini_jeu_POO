require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts
puts "#"*37
puts "| Welcome in my 101 fighting game ! |"
puts "| Last player standing wins !       |"
puts "#"*37

puts
puts "Let's create your fighter."
puts "What's your fighter's name ?"
print ">"
human_player = gets.chomp
human_player = HumanPlayer.new(human_player)

#initiate and fill enemies array
enemies = []
player1 = Player.new("Pepito")
enemies << player1
player2 = Player.new("Pepita")
enemies << player2

#fighting loop
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts
  human_player.show_state
#display menu
  puts
  puts "What will you do this turn?"
  puts
  puts "a - Look for a better weapon."
  puts "h - Look for health packs."
  puts
  puts "Attack a player on sight :"
  puts "0 - Attack #{player1.name} with #{player1.life_points} HP."
  puts "1 - Attack #{player2.name} with #{player2.life_points} HP."
  puts

#gets player input
  print ">"
  action = gets.chomp
  puts
#carry out player's action
  case action
    when  "a"
      human_player.search_weapon
    when  "h"
      human_player.search_health_pack
    when  "0"
      human_player.attacks(player1)
    when  "1"
      human_player.attacks(player2)
    else puts "Bad move. You lost your turn."
  end

  puts
  puts "Enemies strike back !"
    enemies.each do |player|
      if player.life_points > 0
        player.attacks(human_player)
      else puts "#{player.name} is dead."
    end
  end
  puts
  puts "Press Enter to end turn." #require player input to display fighting menu again.
  gets.chomp
end
  puts "Fight is over."
  if human_player.life_points > 0
    puts "Nailed it. What an amazing fighter !"
  else
    puts "You lose."
    puts "Even with 100 HPs, powerful weapons and health packs all around you ?"
    puts "Shame on you."
end

