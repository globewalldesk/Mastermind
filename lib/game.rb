class Game

  COLORS = %w( red orange yellow green blue purple )

  attr_accessor :codelength, :colors, :code, :guesses

  def initialize
    @codelength = 4 # placeholder; later versions will be able to set this
    @colors = COLORS[0,codelength * 2]
    @code = set_code(@codelength)
    @guesses = []
  end

  def set_code(codelength)
    return @colors.shuffle[0,codelength]
  end

  def evaluate_guess(guess_array)
    # Prepend this guess into Game.guesses
    this_guess = {}
    @guesses.unshift(this_guess)
    @guesses[0][:guess] = guess_array

    # Start at zero.
    @guesses[0][:black] = @guesses[0][:white] = 0

    # After matching all blacks, there should be only one white per miss.
    # So, e.g., if the code is red green blue, and someone guesses red red blue,
    # he should get a white for only one of the reds.
    potential_whites = []
    # You'll have to delete the matched colors from the copy so duplicate
    # color guesses don't match a correct guess.
    code_copy = self.code.dup             # Make a shallow copy of the solution.
    code_copy, potential_whites =
      evaluate_blacks(guess_array, code_copy, potential_whites)
    evaluate_whites(code_copy, potential_whites)
    resultword
  end

  def evaluate_blacks(guess_array, code_copy, potential_whites)
    0.upto(guess_array.length - 1) do |i| # Iterate thru guess indexes.
      if @guesses[0][:guess][i] == self.code[i] # If exact match,
        @guesses[0][:black] += 1          # increment black count, and
        code_copy[i] = nil                # delete from copy so it can't be matched again.
      else                                # Otherwise,
        potential_whites << i             # add to array for check for white match.
      end
    end
    return code_copy, potential_whites
  end

  def evaluate_whites(code_copy, potential_whites)
    potential_whites.each do |i|          # Iterate through indexes of misses.
      color = @guesses[0][:guess][i]      # Get color of this guess.
      if code_copy.any? { |x| x == color }  # If the color matches any in copy,
        @guesses[0][:white] += 1          # then increment the whites, and
        code_copy.delete(color)           # make color unavailable to match.
      end
    end
  end

  # Converts a quantity of blacks and whites into an array of "black" and
  # "white" strings; to be displayed on the board.
  def resultword
    resultwords = []
    @guesses[0][:black].times {|i| resultwords << "black"}
    @guesses[0][:white].times {|i| resultwords << "white"}
    @guesses[0][:resultwords] = resultwords
  end

end
