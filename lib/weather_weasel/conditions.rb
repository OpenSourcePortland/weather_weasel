module WeatherWeasel
  class Conditions
    
    def initialize(city, state, temperature_format, client)
      @city = city
      @state = state
      @temperature_format = temperature_format
      @client = client
    end
    
    def raw_data
      @client.parse_url("conditions/q/#{@state}/#{@city}.json")
    end    
  end
end