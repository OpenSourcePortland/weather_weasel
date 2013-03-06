module WeatherWeasel
  class Client
    
    def initialize
      @api_key = ENV["WUNDERGROUND_API_KEY"]
      puts @api_key
    end
    
    def parse_url(url)
      response_body = HTTParty.get("http://api.wunderground.com/api/#{@api_key}/#{url}").body
      JSON.parse(response_body)     
    end
    
  end
end
    