require 'sinatra'

require_relative './lib/game'
require_relative './helpers/helper'
include Helper

enable :sessions

get('/') do
  session[:gamehash] ||= Game.new  # if necessary, initialize empty game data hash
  @gamehash = session[:gamehash]
  session[:instructions] ||= "open"
  @instructions = session[:instructions]
  erb :main
end

post('/guess') do
  session[:gamehash].evaluate_guess(prepare_guess_array(params))
  redirect '/'
end

post('/restart') do
  session[:gamehash] = Game.new(codelength: params[:restart].to_i)
  @won = false
  redirect '/'
end

post('/close_instructions') do
  session[:instructions] = "closed"
  redirect '/'
end
