require 'spec_helper'
require 'nokogiri'

describe GroupedTimeZones::ViewHelpers do
  include GroupedTimeZones::ViewHelpers

  it "should return an array of time zones grouped by USA first and then other" do
    result = grouped_time_zones
    result[0][0].should == 'United States'
    result[0][1].should have(8).items
    result[0][1][0][0].should =~ /\(GMT-\d{2}:\d{2}\)/
    result[1][0].should == 'Other'
    result[1][1].should have(136).items
  end

  it "should time_zone_select should return a select html tag" do
    user = double("user", time_zone: 'Pacific/Honolulu')

    result = Nokogiri::HTML.parse grouped_time_zone_select('user', :time_zone, user)

    result.css('select option').count.should be 144
    selected = result.css('select option[selected="selected"]')
    selected.should have(1).item
    selected.first.attributes['value'].value.should eq 'Pacific/Honolulu'

    opt_groups = result.css('select optgroup')
    opt_groups.should have(2).items
    opt_groups.first.attributes['label'].value.should eq 'United States'
    opt_groups.last.attributes['label'].value.should eq 'Other'
  end
end
