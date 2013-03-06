module WeatherWeasel
  class Forecast
    
    def initialize(city, state, client)
      @city = city
      @state = state
      @client = client
      #set_scale
    end
        
    def raw_data
      @client.parse_url("forecast/q/#{@state}/#{@city}.json")
    end

    def forecast_days
      raw_data["forecast"]["simpleforecast"]["forecastday"]
    end

    def high
      all_highs.max
    end
    
    def low
      all_lows.min
    end
    
    def all_lows(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["low"][@tempature_format]
      end
    end
    
    def set_scale(scale)
      if scale == "imperial"  
        @tempature_format = "fahrenheit" 
      else
        @tempature_format = "celsius" 
      end
    end
    
    
    
    
    def all_highs
      days = raw_data["forecast"]["simpleforecast"]["forecastday"]
      highs = []
      days.each do |day|
        highs << day["high"][@temperature_format]
      end
      highs
    end
  
  end
end
    
    
      