class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} has #{@life_points} HP."
  end

  def gets_damage(damage_taken)
    @life_points = @life_points - damage_taken
    if @life_points <= 0
      puts "Player #{@name} has been defeated !"
      puts "#"*20
    end
  end

  def attacks(player)
    damage_taken = player.compute_damage
    puts "Player #{@name} attacks player #{player.name}."
    puts "Attack inflicts #{damage_taken} damage points."
    player.gets_damage(damage_taken)
    player.show_state
  end

  def compute_damage
    return rand(1..6)
  end

end
