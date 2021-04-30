require_relative "treasure_trove"

class Player
  attr_reader :health
  attr_accessor :name

  def self.from_csv(string)
    name, health = string.split(',')
    Player.new(name, Integer(health))
  end

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end

  def found_treasure(treasure)
    @found_treasure[treasure.name] += treasure.points
    puts "#{@name} found a treasure worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasure}"
  end

  def each_found_treasure
    @found_treasure.each do |key, val|
      treasure = Treasure.new(key, val)
      yield treasure
    end
  end

  def points
    @found_treasure.values.reduce(0, :+)
  end

  def <=>(other)
    other.score <=> score
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def strong?
    @health > 100
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def score
    @health + points
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end

if __FILE__ == $0
  player = Player.new('moe')
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end

