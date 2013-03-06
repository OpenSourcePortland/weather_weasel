module WeatherWeasel
  class Location
    attr_accessor :city, :state
    
    def initialize(city, state, scale="imperial")
      @city = city
      @state = state
      @scale = scale.to_sym
      @client = Client.new
      set_scale
    end
    
    # def get_forecast
    #   @forecast ||= Forecast.new()
    # end
    
    def forecast
      @forecast ||= Forecast.new(@city, @state, @temperature_format, @client)
      @forecast.forecast
    end
    
    def high
      @forecast ||= Forecast.new(@city, @state, @temperature_format, @client)
      @forecast.high
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