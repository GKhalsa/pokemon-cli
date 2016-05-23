require 'net/http'
require 'json'
require 'pry'

class PokemonService

  def get(url = "http://pokeapi.co/api/v1/", path: path)
    uri = URI(url + path + "/")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def pokemon_information(info)
    path = "pokemon/#{info}"
    get(path: path)
  end

  def get_moves_for(info)
    response = pokemon_information(info)
    response["moves"].map {|move| move["name"]}
  end

end
