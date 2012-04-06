# GroupedTimeZones

This is currently intended to be a very simple plugin that only provides a select field with time zones with United States time zones grouped first.

## Installation

Add this line to your application's Gemfile:

    gem 'grouped_time_zones'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grouped_time_zones

## Usage

In your views, where ever you want a time zone select list grouped with US time zones first, drop this in.

    grouped_time_zone_select('user', 'time_zone', @user)

## Planned

* More grouping options
* Not just US first
* Formatting options
* Sorting options
