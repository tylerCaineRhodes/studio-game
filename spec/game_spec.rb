require_relative '../game'

describe Game do
  before do
    @game = Game.new("knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
  end

  it "w00ts the player if a high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)

    @game.play(2)
    @player.health.should == @initial_health + (15 * 2)
  end

  it "does nothing if a medium number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)

    @game.play(2)
    @player.health.should == @initial_health
  end

  it "blams if low number is rolled" do
    Die.any_instance.stub(:roll).and_return(2)

    @game.play(2)
    @player.health.should == @initial_health - (10 * 2)
  end
end
