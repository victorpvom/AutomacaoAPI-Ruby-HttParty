require './data/url.rb'

module Reqres
    include HTTParty
    base_uri URL_BASE2
    format :json
 end