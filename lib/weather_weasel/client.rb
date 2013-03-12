module WeatherWeasel
  class Client
    
    def initialize
      @api_key = ENV["WUNDERGROUND_API_KEY"]
      unless @api_key 
        raise "no api key defined in environment variables"
      end
    end
    
    def parse_url(path)
      body = open("http://api.wunderground.com/api/#{@api_key}/#{path}").read
      JSON.parse(body)
    end
    
  end
end
    