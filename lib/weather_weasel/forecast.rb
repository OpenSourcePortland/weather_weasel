module WeatherWeasel
  class Forecast
    attr_accessor :temperature_format, :rain_format

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

    def set_scale(scale)
      if scale == "imperial"  
        @temperature_format = "fahrenheit" 
        @wind_format = "mph"
        @snow_format = "in"
        @rain_format = "in"
      else
        @temperature_format = "celsius" 
        @wind_format = "kph"
        @snow_fomrat = "cm"
        @rain_format = "mm"
      end
    end

#Highs and lows methods
    def high(scale)
      all_highs(scale).max
    end
    
    def day_high(day_index, format = @rain_format)
      all_highs(format)[day_index]
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

#wind methods    
    def max_wind(scale)
      all_max_wind(scale).max
    end
    
    def all_max_wind(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["maxwind"][@wind_format]
      end
    end

#snow methods    
    def all_snow_day(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["snow_day"][@snow_format]
      end
    end
    
    def highest_snow_day(scale)
      all_snow_day(scale).max
    end
    
    def snow_day(day_index, scale)
      all_snow_day(scale)[day_index]
    end
    
    def all_snow_night(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["snow_night"][@snow_format]
      end
    end
    
    def all_snow_allday(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["snow_allday"][@snow_format]
      end
    end

#Forecast Condition methods
    def forecast_condition(day_index)
      forecast_conditions[day_index]
    end

    def forecast_conditions
      forecast_days.collect do |day|
        day["conditions"]
      end
    end

#QPF Methods
    def qpf_alldays(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["qpf_allday"][@rain_format]
      end
    end

    def qpf_days(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["qpf_day"][@rain_format]
      end
    end

    def qpf_day(day_index, scale)
      qpf_days(scale)[day_index]
    end

    def qpf_nights(scale)
      set_scale(scale)
      forecast_days.collect do |day|
        day["qpf_night"][@rain_format]
      end
    end

    def qpf_night(day_index, scale)
      qpf_nights(scale)[day_index]
    end

    def yo_dawg(joke)
      if joke.length > 1000
        joke
      else
        result = joke + "I put a yo dawg joke in your yo dawg joke so you could say \n"
        yo_dawg(result)
      end
    end 

#Skyicon Methods
    def skyicon(day_index = 0)
      skyicons[day_index]
    end

    def skyicons
      forecast_days.collect do |day|
        day["skyicon"]
      end
    end

#POPs methods
    def pops
      forecast_days.collect do |day|
        day["pop"]
      end
    end
    
  end
end
   
# [{"date"=>{"epoch"=>"1362722400", "pretty"=>"10:00 PM PST on March 07, 2013", 
#     "day"=>7, "month"=>3, "year"=>2013, "yday"=>65, "hour"=>22, "min"=>"00", "sec"=>0, 
#     "isdst"=>"0", "monthname"=>"March", "weekday_short"=>"Thu", "weekday"=>"Thursday", 
#     "ampm"=>"PM", "tz_short"=>"PST", "tz_long"=>"America/Los_Angeles"}, "period"=>1, 
#      "icon"=>"rain", 
#       "icon_url"=>"http://icons-ak.wxug.com/i/c/k/rain.gif", 
#        "snow_allday"=>{"in"=>0, "cm"=>0}, "snow_day"=>{"in"=>0, 
#         "cm"=>0}, "snow_night"=>{"in"=>0, "cm"=>0}, "maxwind"=>{"mph"=>9, "kph"=>14, "dir"=>"South", 
#           "degrees"=>172}, "avewind"=>{"mph"=>7, "kph"=>11, "dir"=>"WNW", "degrees"=>294}, 
#           "avehumidity"=>70, "maxhumidity"=>90, "minhumidity"=>59}, {"date"=>{"epoch"=>"1362808800", 
#             "pretty"=>
