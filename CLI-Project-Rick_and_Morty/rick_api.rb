require 'open-uri'
require 'net/http'
require 'json'
require 'pry'
require 'awesome_print'
require 'rest-client'
require_relative './rick.rb'

class RickApi
    BASE_URL = 'https://rickandmortyapi.com/api/character/?name='

    def self.get_ricks(name)
        response = RestClient.get(BASE_URL + name)
        json = JSON.parse(res.body)
        json["results"].each do |rick|
            Rick.new(rick["name"], rick["status"], rick["origin"]["name"])
        end
    end
end

RickApi.get_ricks
ap Rick.all

