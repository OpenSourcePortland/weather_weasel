module WeatherWeasel
  class Client
    
    def initialize
      @api_key = ENV["wunderground_api_key"]
      puts @api_key
    end
    
    def parse_url(url)
      response_body = HTTParty.get("http://api.wunderground.com/api/#{@api_key}/#{url}").body
      JSON.parse(response_body)     
    end
    
  end
end
    