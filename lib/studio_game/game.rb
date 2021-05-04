require_relative 'game_turn'

module StudioGame
  class Game
    attr_reader :title

    def initialize(title)
    @title = title
    @players = []
    end

    def add_player(player)
      @players << player
    end

    def high_score_entry(player)
      formatted_name = player.name.ljust(20, '.')
      "#{formatted_name} #{player.score}"
    end

    def load_players(input_file)
      File.readlines(input_file).each do |line|
        add_player(Player.from_csv(line))
      end
    end

    def save_high_scores(to_file="high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |player| 
          file.puts high_score_entry(player)
        end
      end
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
        puts high_score_entry(player)
      end
      
      @players.each do |player|
        puts "\n#{player.name}'s point totals:"
        puts "#{player.points} grand total points"
      end

      puts "#{total_points} total points from treasures found"
    end

    def play(rounds)
      # treasures = TreasureTrove::TREASURES

      # puts "\nThere are #{treasures.size} treasures to be found:"

      # treasures.each do |treasure|
      #   puts "A #{treasure.name} is worth #{treasure.points} points"
      # end

      # puts "There are #{@players.size} players in #{@title}"

      # @players.each do |player|
      #   puts player
      # end
    

      (1..rounds).each do |round|
        if block_given?
          break if yield()
        end

        puts "\nRound #{round}"
        @players.each do |player|
          GameTurn.take_turn(player)
          puts player
        end
      end
    end

    def total_points
      @players.reduce(0) { |acc, player| acc + player.points }
    end
  end
end
 

