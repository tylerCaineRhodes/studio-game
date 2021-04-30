require_relative 'player'
require_relative 'game'



knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(VARGS.shift ||"players.csv")


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