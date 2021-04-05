require_relative 'game'

def time

  current_time = Time.new
  current_time.strftime("%I:%M:%S")
end


player1 = Player.new('moe')
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
players = [player1, player2, player3]

knuckleheads = Game.new("Knuckleheads")
players.each { |p| knuckleheads.add_player(p) }
knuckleheads.play
