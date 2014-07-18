require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require './lib/scraper.rb'
require './lib/texter.rb'

get '/' do
  @today = Scrape.new
  erb :index
end