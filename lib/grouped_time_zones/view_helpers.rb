module GroupedTimeZones
  module ViewHelpers
    def  grouped_time_zone_select(name, attribute, record=nil)
      
      select_tag("#{name}[#{attribute}]", grouped_options_for_select(grouped_time_zones, (record ? record.send(attribute.to_sym) : nil)))
    end

    def grouped_time_zones
      us_zones = ActiveSupport::TimeZone.us_zones
      other_zones = ActiveSupport::TimeZone.all.reject{|tz| tz.name =~ %r{/} }.sort - us_zones
      zone_options = lambda do |zones|
        zones.map { |tz| [tz.to_s, tz.tzinfo.identifier] }
      end
      return [['United States', zone_options.call(us_zones)], ['Other', zone_options.call(other_zones)]]
    end
  end
end
