require 'spec_helper'

describe WeatherWeasel::Location do
  before(:all) do
    @location = WeatherWeasel::Location.new("Portland", "OR")
  end
  
  it "returns a high temperature", :vcr do
      @location.high.should == 64
  end
  
  it "returns a low temperature", :vcr do
      @location.low.should == 46
  end
  
  it "returns an array of all low temperatures", :vcr do
      @location.all_lows.should == [46, 50, 52, 54]
  end
end