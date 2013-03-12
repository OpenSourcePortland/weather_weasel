module WeatherWeasel
  class Almanac
    
    def initialize(city, state, tempature_format, client)
      @city = city
      @state = state
      @tempature_format = tempature_format
      @client = client
    end
    
    def raw_data
      @data ||= @client.parse_url("almanac/q/#{@state}/#{@city}.json")
    end
  end
end