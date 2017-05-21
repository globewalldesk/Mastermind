require 'minitest/autorun'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_initializes_game_hash_when_blank
    gamehash = Game.new
    assert_equal(gamehash.codelength, 3)
    assert_equal(gamehash.code.length, 3)
    assert_equal(gamehash.guesses, [])
  end

end
