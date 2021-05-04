require_relative "player"
require_relative "auditable"

class Die
  attr_reader :number

  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
    audit
    @number
  end
end

