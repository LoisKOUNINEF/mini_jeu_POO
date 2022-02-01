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
    damage_taken = compute_damage
    puts "Player #{@name} attacks player #{player.name}."
    puts "Attack inflicts #{damage_taken} damage points."
    player.gets_damage(damage_taken)
    player.show_state
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    @life_points = 100
    super(name)
  end

  def show_state
    puts "#{@name} has #{@life_points} HP and a level #{@weapon-level} weapon."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_random = rand(1..6)
    puts "You found a level #{weapon_random} weapon."
    if @weapon_level < weapon_random
      puts "This weapon is better than your actual one. You keep it (obviously)."
      @weapon_level = weapon_level
    else
      puts "This weapon isn't that good. You discard it."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    case health_pack
    when 1
      puts "You found nothing."
    when 2..5
      if @life_points + 50 > 100
        then @life_points = 100
      else @life_points += 50
        puts "You found a Regular Health Pack. You gain +50HP."
      end
    when 6
      if @life_points + 80 > 100
        then @life_points = 100
      else @life_points += 80
        puts "You found a Mega Health Pack. You gain +80HP."
      end
    end
  end
end

