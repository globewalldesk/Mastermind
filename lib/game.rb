class Game

  attr_accessor :codelength, :code, :guesses

  def initialize
    @codelength = 3
    @code = [1, 2, 3] # placeholders
    @guesses = []
  end

end
