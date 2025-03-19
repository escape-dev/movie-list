require "uri"
require "json"
require "net/http"

class TmdbApi 
  MOVIEDB_BASE_URL = ENV["MOVIEDB_BASE_URL"]
  MOVIEDB_ACCESS_TOKEN = ENV["MOVIEDB_ACCESS_TOKEN"]

  def self.base_request(path, params = {})
    url = URI("#{MOVIEDB_BASE_URL}#{path}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{MOVIEDB_ACCESS_TOKEN}"
    request["accept"] = "application/json"

    response = http.request(request)
    
    result = JSON.parse(response.body)
    result["results"]
  rescue StandardError => e
    { error: e.message }
  end

  def self.movie(type) 
    base_request("/movie/#{type}?language=en-US&page=1")
  end
end