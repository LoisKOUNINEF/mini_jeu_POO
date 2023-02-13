class Game

	require_relative 'player'
	require_relative 'inputs'

	def kill_player
	end

	def is_still_ongoing
	end
	
	def show_players(enemies)
		enemies.each_with_index do |enemy, i|
			puts "Enemy #{i+1} : #{enemy.name}, #{enemy.life_points}"
		end
	end

	def gameplay
	end

end