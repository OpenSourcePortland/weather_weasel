require 'spec_helper'

describe WeatherWeasel::Forecast do
  context "one vcr cassette all methods" do
    use_vcr_cassette "forecast_raw_data"
  
    before(:all) do
      client = WeatherWeasel::Client.new
      @portland = WeatherWeasel::Forecast.new("Portland", "OR", client)
    end
  
    it "can return the highest temperature in its forecast days in fahrenheit" do 
      @portland.high("imperial").should == 68
    end
    it "can return the highest temperature in its forecast days in celsius" do
      @portland.high("metric").should == 20
    end
  
    it "can return the lowest temperature in its forecast days in fahrenheit" do
      @portland.low("imperial").should == 48
    end
  
    it "can return the lowest temperature in its forecast days in celsius" do
      @portland.low("metric").should == 9
    end
  
    it "can return the an array of highs in its forecast days" do
      @portland.all_highs("imperial").should == [64, 68, 63, 61]
    end
  
    it "can return the an array of lows in its forecast days" do
      @portland.all_lows("imperial").should == [48, 52, 50, 50] 
    end
  
    it "can return fahrenheit when passed imperial" do
      @portland.set_scale("imperial") == "fahrenheit"
    end
  
    it "can return celsius when passed metric" do
      @portland.set_scale("metric") == "celsius"
    end
  
    it "can return the array of max wind speeds in its forecast days" do
      @portland.all_max_wind("imperial").should == [10, 9, 8, 4] 
    end

    it "can return the highest wind speed in its forecast days" do
      @portland.max_wind("imperial").should == 10
    end

    it "can return the highest wind speed in its forecast days" do
      @portland.max_wind("metric").should == 16
    end
  
    it "can return an array of the snow accumulation for each day in the forecast" do
      @portland.all_snow_day("imperial").should == [0, 0, 0, 0]
    end
  
    it "can return the highest snow day accumulation of the forecast in inches" do
      @portland.highest_snow_day("imperial").should == 0
    end
  
    it "can return the highest snow accumulation of the forecast in centimeters" do
      @portland.highest_snow_day("metric").should == 0
    end
  
    it "can return the snow accumulation for a given day in the forecast" do
      @portland.snow_day(0, "metric").should == 0
    end
  
    it "can return an array of the snow night accumilation for each day in the forecast" do
      @portland.all_snow_night("imperial").should == [0, 0, 0, 0]
    end
  
    it "can return an array of the all day accumilation for each day in the forecast" do
      @portland.all_snow_allday("imperial").should == [0, 0, 0, 0]
    end
  
    it "can return all skyicon in its forecast days" do
      @portland.skyicon(0).should == "cloudy"
    end 

    it "can return all skyicons in its forecast days" do
      @portland.skyicons.should ==  ["cloudy", "partlycloudy", "mostlycloudy", "partlycloudy"]
    end 

    it "can return the pops for its forecast days" do
      @portland.pops.should == [20, 40, 40, 0]
    end

    it "can return the qpf_alldays for its forecast days" do
      @portland.qpf_alldays("imperial").should == [0.0, 0.02, 0.21, 0.01]
    end

    it "can return all forecast_conditions in its forecast days" do
      @portland.forecast_conditions.should == ["Chance of Rain", "Chance of Rain", "Rain", "Partly Cloudy"]
    end

    it "can return all forecast_condition in its forecast days" do
      @portland.forecast_condition(0).should == "Chance of Rain"
    end
  end
end

