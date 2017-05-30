require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'sinatra'

require_relative './lib/game'
require_relative './helpers/helper'
include Helper # TRY REMOVING THIS AND SEE IF IT STILL WORKS

enable :sessions

gamehash = Game.new

get('/') do
  gamehash ||= Game.new  # if necessary, initialize empty game data hash
  @gamehash = gamehash
  erb :main
end

post('/guess') do
  gamehash.evaluate_guess(prepare_guess_array(params))
  p "White:", gamehash.guesses[0][:white].inspect
  p "Black:", gamehash.guesses[0][:black].inspect
  redirect '/'
end
