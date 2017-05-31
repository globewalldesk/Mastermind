require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'sinatra'

require_relative './lib/game'
require_relative './helpers/helper'
include Helper # TRY REMOVING THIS AND SEE IF IT STILL WORKS

enable :sessions

get('/') do
  session[:gamehash] ||= Game.new  # if necessary, initialize empty game data hash
  @gamehash = session[:gamehash]
  erb :main
end

post('/guess') do
  session[:gamehash].evaluate_guess(prepare_guess_array(params))
  redirect '/'
end

post('/new') do
  session[:gamehash] = Game.new
  @won = false
  redirect '/'
end
