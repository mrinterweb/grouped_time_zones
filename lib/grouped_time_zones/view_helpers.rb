module GroupedTimeZones
  module ViewHelpers
    def  time_zone_select(name, record)
      select_tag(name, grouped_options_for_select(grouped_time_zones, record.time_zone))
    end

    def grouped_time_zones
      us_zones = ActiveSupport::TimeZone.us_zones
      other_zones = ActiveSupport::TimeZone.all.sort - us_zones
      zone_options = lambda do |zones|
        zones.map { |tz| [tz.to_s, tz.tzinfo.identifier] }
      end
      return [['United States', zone_options.call(us_zones)], ['Other', zone_options.call(other_zones)]]
    end
  end
end
