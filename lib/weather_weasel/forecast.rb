module WeatherWeasel
  class Forecast
    
    def initialize(city, state, temperature_format, client)
      @city = city
      @state = state
      @temperature_format = temperature_format
      @client = client
    end
    
    def forecast
      @client.parse_url("forecast/q/#{@state}/#{@city}.json")
    end
    def high
      all_highs.max
    end
    
    def low
      all_lows.min
    end
    
    def all_lows
      days = forecast["forecast"]["simpleforecast"]["forecastday"]
      lows = []
      days.each do |day|
        lows << day["low"][@temperature_format]
      end
      lows
    end
    
    def all_highs
      days = forecast["forecast"]["simpleforecast"]["forecastday"]
      highs = []
      days.each do |day|
        highs << day["high"][@temperature_format]
      end
      highs
    end
  
  end
end
    
    
      