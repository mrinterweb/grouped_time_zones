module GroupedTimeZones
  module ViewHelpers
    def  grouped_time_zone_select(name, attribute, record=nil, force_uniq=false)
      select_tag("#{name}[#{attribute}]", grouped_options_for_select(grouped_time_zones(force_uniq), (record ? record.send(attribute.to_sym) : nil)))
    end

    def grouped_time_zones(force_uniq=false)
      us_zones      = ActiveSupport::TimeZone.us_zones
      non_us_zones  = other_zones(us_zones, force_uniq)
      zone_options  = lambda do |zones|
        zones.map { |tz| [tz.to_s, tz.tzinfo.identifier] }
      end
      return [['United States', zone_options.call(us_zones)], ['Other', zone_options.call(non_us_zones)]]
    end

    private

    def other_zones(excluded_zones, force_uniq=false)
      other_zones = force_uniq ? ActiveSupport::TimeZone.all.reject{|tz| tz.name =~ %r{/} }.uniq{|tz| tz.tzinfo.identifier } : ActiveSupport::TimeZone.all.reject{|tz| tz.name =~ %r{/} }
      other_zones.sort - excluded_zones
    end
  end
end
