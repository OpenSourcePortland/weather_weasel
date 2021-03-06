module WeatherWeasel
  class Location
    
    def initialize(city, state, scale = "imperial")
      @city = city
      @state = state
      @scale = scale.to_sym
      @client = Client.new
    end

#current Hurricane Method        
    def current_hurricane
      @current_hurricane ||= CurrentHurricane.new(@client)
    end

    def current_hurricane_raw
      current_hurricane.raw_data
    end

#Almanac method   
    def almanac_raw
      almanac.raw_data
    end

    def almanac
      @almanac ||= Almanac.new(@city, @state, @scale, @client)
    end
    
#Condition (specific location method)   
    def conditions
      @conditions ||= Conditions.new(@city, @state, @scale, @client)
    end

#Forecast_conditions Methods
    def forecast_conditions
      forecast.forecast_conditions
    end

    def forecast_condition(day_index)
      forecast.forecast_condition(day_index)
    end

#POPS Methods
    def pop(day_index)
      forecast.pops[day_index]
    end
    
    def pops
      forecast.pops
    end

#QPF Methods
    def qpf_alldays(scale = @scale)
      forecast.qpf_alldays(scale)
    end
    
#Forecast Methods
    def forecast
      @forecast ||= Forecast.new(@city, @state, @client)
    end
    
    def forecast_raw
      forecast.raw_data
    end

#Skyicon Methods
    def skyicons
      forecast.skyicons
    end

    def skyicon(day_index)
      forecast.skyicon(day_index)
    end
 
#Temperature Methods    
    def high(scale = @scale)
      forecast.high(scale)
    end

    def day_high(day_index, scale = @scale)
      forecast.day_high(day_index, scale)
    end
    
    def day_low(day_index, scale = @scale)
      forecast.day_low(day_index, scale)
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
    
    def all_max_wind(scale = @scale)
      forecast.all_max_wind(scale)
    end
    
    def max_wind(scale = @scale)
      forecast.max_wind(scale)
    end
    
    def all_snow_day(scale = @scale)
      forecast.all_snow_day(scale)
    end
    
    def snow_day(day, scale = @scale)
      forecast.snow_day(day, scale)
    end
    
    def highest_snow_day(scale = @scale)
      forecast.highest_snow_day(scale)
    end
    
    def all_snow_night(scale = @scale)
      forecast.snow_night(scale)
    end
    
    def all_snow_allday(scale = @scale)
      forecast.all_snow_allday(scale)
    end
    
  end
end



#portland = Location.new("Portland", "OR", "metric")
# portland.forecast("metric")