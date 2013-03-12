require 'spec_helper'

describe WeatherWeasel::Location do
  before(:all) do
    @location = WeatherWeasel::Location.new("Portland", "OR")
  end
  context "one vcr cassette all forecast methods" do
    use_vcr_cassette "location_forecast_raw_data"  
    it "returns a high temperature" do
        @location.high.should == 68
    end
  
    it "returns a low temperature" do
        @location.low.should == 48
    end
  
    it "returns an array of all low temperatures" do
        @location.all_lows.should == [48, 52, 50, 50]
    end
  end
end