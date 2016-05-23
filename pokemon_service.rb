require 'net/http'
require 'json'
require 'pry'

class PokemonService

  def get(url = "http://pokeapi.co/api/v1/", path: path)
    uri = URI(url + path + "/")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

end
