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

  def next_evolution(id)
    response = pokemon_information(id)
    response["evolutions"].first["to"] unless response["evolutions"].empty?
  end

  def evolutions(id)
    response = pokemon_information(id)
    evolutions = []
    until next_evolution(id).nil?
      evolutions << next_evolution(id)
      id = next_evolution(id).downcase
    end
    evolutions.join(", ")
  end
end
