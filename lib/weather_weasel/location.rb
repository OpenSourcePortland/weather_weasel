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
    
    def current_hurricane
      @current_hurricane ||= CurrentHurricane.new(@client)
    end

    def current_hurricane_raw
      current_hurricane.raw_data
    end
    
    def almanac_raw
      almanac.raw_data
    end
    
    def conditions
      @conditions ||= Conditions.new(@city, @state, @scale, @client)
    end

    def forecast_conditions
      forecast.forecast_conditions
    end

    def forecast_condition(day_index)
      forecast.forecast_condition(day_index)
    end

    def pop(day_index)
      forecast.pops(day_index)
    end
    
    def pops
      forecast.pops
    end

    def qpf_alldays(scale=@rain_format)
      forecast.qpf_allday(scale)
    end

    def qpf_days(scale=@rain_format)
      forecast.qpf_days(scale)
    end


    def forecast
      @forecast ||= Forecast.new(@city, @state, @client)
    end
    
    def forecast_raw
      forecast.raw_data
    end

    def skyicons
      forecast.skyicons
    end

    def skyicon(day_index)
      forecast.skyicon(day_index)
    end
    
    def high(scale = @scale)
      forecast.high(scale)
    end
    
    def low(scale = @scale)
      forecast.low(scale)     
    end
    
    def all_highs(scale = @scale)
      forecast.all_highs(scale)
    end
    
    def all_lows(scale = @scale)
      forecast.all_lows(scale)
    end
  end
end



#portland = Location.new("Portland", "OR", "metric")
# portland.forecast("metric")