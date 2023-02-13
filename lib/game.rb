class Game
	require_relative 'player'

	attr_accessor :human_player, :enemies, :enemies_number

	def welcome_message
		system("clear")
		puts
		puts "#"*37
		puts "| Welcome in my 101 fighting game ! |"
		puts "| Last player standing wins !       |"
		puts "#"*37
	end

	def get_player_name
		puts
		puts "Let's create your fighter."
		puts "What's your fighter's name ?"
		print ">"
		human_player_name = gets.chomp
		@human_player = HumanPlayer.new(human_player_name)
	end

	def get_enemies_number
		puts
		puts "How many enemies are you fighting ?"
		print ">"
		@enemies_number = gets.chomp.to_i

		while @enemies_number > 10
			puts
			puts "No more than 10 enemies can be fougth at one time"
			print ">"
			@enemies_number = gets.chomp.to_i
		end
	end

	def initialize_enemies
		enemiesNames = ["Pepito", "Pepita", "Fluffy", "Sauron", "Voldemort", "Gandalf", "Luke", "Bobo", "Bibi", "Kiki", "Koko", "Timmy", "Struppi", "Haddock", "Me", "Myself", "LackOfImagination", "Funny", "Alf", "Jimmy", "Billy", "Cartman", "McKey", "MrSlave", "SpongeBob"]
		@enemies = []

		enemies_number.times do |i|
			playerName = enemiesNames.sample
			@enemies << Player.new(playerName)
			enemiesNames.delete(playerName)
		end
	end

	def show_enemies
		puts"You will have to defeat following enemies :"
		enemies.each_with_index do |enemy, i|
			puts "Enemy #{i+1} : #{enemy.name}"
		end
	end

	def perform
		welcome_message
		get_player_name
		get_enemies_number
		initialize_enemies
		show_enemies
	end

end