require './data/url.rb'

module Poke
    include HTTParty
    base_uri URL_BASE
    format :json
 end