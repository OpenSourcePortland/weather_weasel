module WeatherWeasel
  class Location
    
    def initialize(city, state, scale="imperial")
      @city = city
      @state = state
      @scale = scale
      @client = Client.new
    end
    
    def almanac
      @almanac ||= Almanac.new(@city, @state, @scale, @client)
    end
    
    def almanac_raw
      almanac.raw_data
    end
    
    def forecast
      @forecast ||= Forecast.new(@city, @state, @client)
    end
    
    def forecast_raw(scale=false)
      override_scale(scale) if scale
      forecast.raw_data
    end
    
    def high(scale=false)
      forecast.high
      set_scale(scale)
    end
    
    def low
      forecast.low
    end
    
    def all_highs
      forecast.all_highs
    end
    
    def all_lows(scale = @scale)
      forecast.all_lows(scale)
    end
  end
end



#portland = Location.new("Portland", "OR", "metric")
# portland.forecast("metric")