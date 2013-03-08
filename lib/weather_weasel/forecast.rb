module WeatherWeasel
  class Forecast
    attr_accessor :temperature_format, :rain_format

    def initialize(city, state, client)
      @city = city
      @state = state
      @client = client
      set_scale("imperial")
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
        day["low"][@temperature_format].to_i
      end
    end

    def all_highs(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["high"][@temperature_format].to_i
      end
    end

    def forecast_condition(day_index = 0)
      forecast_conditions[day_index]
    end

    def forecast_conditions
      forecast_days.collect do |day|
        day["conditions"]
      end
    end

    def qpf_alldays(format = "in")
      forecast_days.collect do |day|
        day["qpf_allday"][@rain_format]
      end
    end


    def qpf_days(format = "in")
      forecast_days.collect do |day|
        day["qpf_day"][@rain_format]
      end
    end



    def skyicon(day_index = 0)
      skyicons[day_index]
    end

    def skyicons
      forecast_days.collect do |day|
        day["skyicon"]
      end
    end

    def pops
      forecast_days.collect do |day|
        day["pop"]
      end
    end

    def pop(day_index = 0)
      pops[day_index]
    end
    
    def set_scale(scale)
      if scale == "imperial"  
        @temperature_format = "fahrenheit"
        @rain_format = "in" 
      else
        @temperature_format = "celsius" 
        @rain_format = "mm"
      end
    end 
  end
end
    


      