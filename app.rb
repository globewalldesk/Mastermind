require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'sinatra'

require_relative './lib/game'
require_relative './helpers/helper'
include Helper # TRY REMOVING THIS AND SEE IF IT STILL WORKS

enable :sessions

get('/') do
  @gamehash ||= Game.new  # if necessary, initialize empty game data hash
end

post('/guess') do
  @gamehash.evaluate_guess(prepare_guess_array(params))
end
