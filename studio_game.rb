require_relative 'berserk_player'
require_relative 'game'
require_relative 'player'



knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(VARGS.shift ||"players.csv")

berserker = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)


loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    break
  else
    puts "Please enter a number or 'quit'"
  end
end