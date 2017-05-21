require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'sinatra'

require_relative './lib/game'

enable :sessions

get('/') do
  @gamehash ||= Game.new  # if necessary, initialize empty game data hash
end
