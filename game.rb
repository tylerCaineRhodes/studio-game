require_relative 'game_turn'

class Game
  attr_reader :title

  def initialize(title)
   @title = title
   @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_stats
    sorted_players = @players.sort { |a,b| b.score - a.score }
    strong_players, wimpy_players = @players.partition do |player|
      player.strong?
    end

    puts "\n#{@title} Statistics:"
    puts "\n#{strong_players.size} strong players:"

    strong_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{wimpy_players.size} wimpy players:"

    wimpy_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{title} High Scores:" 
    
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
        puts "#{formatted_name} #{player.score}"
    end

  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}"

    @players.each do |player|
      puts player
    end

    rounds.times do |round|
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end

  end
end

