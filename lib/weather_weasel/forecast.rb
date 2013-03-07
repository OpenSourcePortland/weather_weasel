module WeatherWeasel
  class Forecast
    
    def initialize(city, state, client)
      @city = city
      @state = state
      @client = client
    end
        
    def raw_data
      @client.parse_url("forecast/q/#{@state}/#{@city}.json")
    end

    def forecast_days    
      raw_data["forecast"]["simpleforecast"]["forecastday"]
    end

    def high(scale)
      all_highs(scale).max
    end
    
    def low(scale)
      all_lows(scale).min
    end
    
    def all_lows(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["low"][@temperature_format]
      end
    end

    def all_highs(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["high"][@temperature_format]
      end
    end
    
    def max_wind(scale)
      all_max_wind(scale).max
    end
    
    def all_max_wind(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["maxwind"][@wind_format]
      end
    end
    
    def all_snow_day(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["snow_day"][@snow_format]
      end
    end
    
    def highest_snow_day(scale)
      all_snow_day(scale).max
    end
     
    def set_scale(scale)
      if scale == "imperial"  
        @temperature_format = "fahrenheit" 
        @wind_format = "mph"
        @snow_format = "in"
      else
        @temperature_format = "celsius" 
        @wind_format = "kph"
        @snow_fomrat = "cm"
      end
    end 
  end
end
    
    
      