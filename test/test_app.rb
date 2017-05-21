ENV['RACK_ENV'] = "test"

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'
require_relative '../lib/game'

class AppTest < Minitest::Test
  include Rack::Test::Methods
  # include Process     # forgot why I needed this; doesn't seem needed now

  def app
    Sinatra::Application
  end

  def test_get_root
    get '/'
    assert last_response.ok?
  end

end
