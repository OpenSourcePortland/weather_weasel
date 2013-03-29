# WeatherWeasel

We have taken the standard Weather Underground api and made classes and methods to return the data.  To use this, you'll need a Weather Underground API key from here www.wunderground.com/weather/api/ (Anvil Developer package is free).  Export an environment variable called WUNDERGROUND_API_KEY with your key in it.

This is still a work in progress and any help you'd like to volunteer would be greatly appreciated!  If anything is unclear please let us know.

## Installation

Add this line to your application's Gemfile:

    gem 'weather_weasel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weather_weasel

## Usage

Export an environment variable called WUNDERGROUND_API_KEY with your Wunderground API key in it.

	require 'weather_weasel'
	p = WeatherWeasel::Location.new("Portland", "OR")
	p.all_highs # An array of all highs in the forecast in imperial format
	 # => [61, 54, 69, 70]
	p.high # The highest high in the forecast
	 # => 70
	p.high("metric") # The highest high in the forecast in metric format
	 # => 21
	 
Setting Metric/ Imperial

	 p = WeatherWeasel::Location.new("Portland", "OR") # Default is imperial measurements
	 p = WeatherWeasel::Location.new("Portland", "OR", "metric") Set all measurements to metric
	 p.high("metric") # Set a specific method by passing "metric" or "imperial"
	 
## All Methods

  	p.forecast_raw # returns all forecast data from Wunderground API in JSON
  
  	p.high # The highest high in the forecast
	# => 70
	 
	p.low # The lowest low in the forecast
	# => 37
	 
	p.all_highs # Returns all daily highs as an array
	# => [54, 54, 50, 55]
	 
	p.all_lows # Returns all daily lows as an array
	# => [37, 41, 46, 39]
	 
	p.day_high(0) # Takes day as argument and returns high for the day 
	# => 54 
	 
	p.day_low(2) # Takes day as argument and returns high for the day 
 	# => 46
 	  
	p.max_wind # Returns max wind for windiest day
	# => 16

  	p.all_max_wind # Returns max wind for each day as an array
   	# => [8, 8, 10, 16] 
  
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request