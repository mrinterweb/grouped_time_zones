require 'grouped_time_zones/view_helpers'

module GroupedTimeZones
  class Railtie < Rails::Railtie
    initializer "grouped_time_zones.view_helpers" do |app|
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
