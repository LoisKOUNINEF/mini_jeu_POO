class Game

	require_relative 'player'
	require_relative 'inputs'

	def player_menu(enemies)
		puts
	  puts "What will you do this turn?"
	  puts
	  puts "a - Look for a better weapon."
	  puts "h - Look for health packs."
	  puts
	  puts "Attack a player on sight :"
	  enemies.each_with_index do |enemy, i|
		  puts "#{i+1} - Attack #{enemy.name} with #{enemy.life_points} HP and a level #{enemy.weapon_level} weapon."
		end
	end

	def player_action(human_player, enemies)
		player_menu(enemies)
	  print ">"
	  action = gets.chomp
	  puts
		enemies.each_with_index do |enemy, i|
			case action
				when "#{i+1}"
				  human_player.attacks(enemy)
		  end
		end
		case action
			when "a"
			  human_player.search_weapon
			when "h"
			  human_player.search_health_pack
		end
	end

	def enemies_attack(human_player, enemies)
		puts
	  puts "Enemies strike back !"
	  enemies.each do |enemy|
	    if (enemy.life_points > 0)
	      then enemy.attacks(human_player)
	    else puts "#{enemy.name} is dead."
	    end
	  end
	end

	# def kill_player
	# end

	def is_still_ongoing(human_player, enemies)
		while (human_player.life_points > 0 && enemies.length > 0)
  	gameloop(human_player, enemies) 
  	end
  	return gameover(human_player)
	end

	def gameover(human_player)
		puts "Fight is over."
	  if (human_player.life_points > 0)
	    then puts "Nailed it. What an amazing fighter !"
	  else
	    puts "You lose."
	    puts "Even with 100 HPs, powerful weapons and health packs all around you ?"
	    puts "Shame on you."
	  end
	end

	def gameloop(human_player, enemies)
			player_action(human_player, enemies)
			enemies_attack(human_player, enemies)
			show_players(human_player, enemies)
			puts
		  puts "Press Enter to end turn."
		  gets.chomp
	end
	
	def show_players(human_player, enemies)
	  human_player.show_state
		enemies.each do |enemy|
			enemy.show_state
		end
	end

	def gameplay(human_player, enemies)
		is_still_ongoing(human_player, enemies)
	end
end
  