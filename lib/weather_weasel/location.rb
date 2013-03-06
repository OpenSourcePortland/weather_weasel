module WeatherWeasel
  class Location
    
    def initialize(city, state, scale="imperial")
      @city = city
      @state = state
      @scale = scale.to_sym
      @client = Client.new
      set_scale
    end
    
    def forecast
      @forecast ||= Forecast.new(@city, @state, @temperature_format, @client)
    end
    
    def overide_scale(scale)
      @scale = scale
      set_scale
    end
    
    def forecast_raw(scale=false)
      override_scale(scale) if scale
      forecast.forecast_data
    end
    
    def high
      forecast.high
    end
    
    def low
      forecast.low
    end
    
    def all_highs
      forecast.all_highs
    end
    
    def all_lows
      forecast.all_lows
    end
    
    def set_scale
      if @scale == :imperial
        @temperature_format = "fahrenheit"
      else
        @temperature_format = "celsius"
      end
    end
        
  end
end


#portland = Location.new("Portland", "OR", "metric")
# portland.forecast("metric")