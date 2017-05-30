require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../helpers/helper'
include Helper

class GameTest < Minitest::Test

  def test_initializes_game_hash_when_blank
    gamehash = Game.new
    assert_kind_of(Game, gamehash)
  end

  # Does the gamehash have a codelength of 3? Sets a policy.
  def test_set_codelength
    gamehash = Game.new
    assert_equal(gamehash.codelength, 3)
  end

  # Is gamehash's code 3 long? Checks if actual code follows policy.
  def test_generate_code
    gamehash = Game.new
    assert_equal(gamehash.code.length, 3)
  end

  def test_check_guess
    gamehash = Game.new
    gamehash.codelength = 3
    gamehash.code = %w(red blue green) # change code for test
    params = { peg0: "red", peg1: "blue", peg2: "green" }
    gamehash.evaluate_guess(prepare_guess_array(params))

    # Does check_guess append correctly-formatted data to gamehash.guesses?
    assert_equal(gamehash.guesses[0][:guess], %w(red blue green))

    # Given various codes and guesses, does check_guess elicit correct hint?
    # Perfect guess; 3 black
    assert_equal(gamehash.guesses[0][:black], 3)
    assert_equal(gamehash.guesses[0][:white], 0)

    # All wrong; no black or white
    params = { peg0: "yellow", peg1: "pink", peg2: "purple" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(0, gamehash.guesses[0][:black])
    assert_equal(0, gamehash.guesses[0][:white])

    # All white
    params = { peg0: "green", peg1: "red", peg2: "blue" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(0, gamehash.guesses[0][:black])
    assert_equal(3, gamehash.guesses[0][:white])

    # One black, two white
    params = { peg0: "red", peg1: "green", peg2: "blue" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(1, gamehash.guesses[0][:black])
    assert_equal(2, gamehash.guesses[0][:white])

    # Two black, zero white
    params = { peg0: "red", peg1: "blue", peg2: "pink" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(2, gamehash.guesses[0][:black])
    assert_equal(0, gamehash.guesses[0][:white])

    # Zero black, two white
    params = { peg0: "blue", peg1: "red", peg2: "pink" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(0, gamehash.guesses[0][:black])
    assert_equal(2, gamehash.guesses[0][:white])

    # Guess is red, green, red; should be 1 black and 1 white
    params = { peg0: "red", peg1: "green", peg2: "red" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(1, gamehash.guesses[0][:black])
    assert_equal(1, gamehash.guesses[0][:white])

    # Guess is all blues; should be 1 black, no whites
    params = { peg0: "blue", peg1: "blue", peg2: "blue" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(1, gamehash.guesses[0][:black])
    assert_equal(0, gamehash.guesses[0][:white])

    # One guess, red; should be 1 black
    params = { peg0: "red", peg1: "", peg2: "" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(1, gamehash.guesses[0][:black])
    assert_equal(0, gamehash.guesses[0][:white])

    # No guesses = nothing right
    params = { peg0: "", peg1: "", peg2: "" }
    gamehash.evaluate_guess(prepare_guess_array(params))
    assert_equal(0, gamehash.guesses[0][:black])
    assert_equal(0, gamehash.guesses[0][:white])
  end

end
