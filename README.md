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

This will produce the following html

    <select name="user[time_zone]" id="user_time_zone">
      <optgroup label="United States">
        <option selected="selected" value="Pacific/Honolulu">(GMT-10:00) Hawaii</option>
        <option value="America/Juneau">(GMT-09:00) Alaska</option>
        <option value="America/Los_Angeles">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
        <option value="America/Phoenix">(GMT-07:00) Arizona</option>
        <option value="America/Denver">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
        <option value="America/Chicago">(GMT-06:00) Central Time (US &amp; Canada)</option>
        <option value="America/New_York">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
        <option value="America/Indiana/Indianapolis">(GMT-05:00) Indiana (East)</option>
      </optgroup>
      <optgroup label="Other">
        <option value="Pacific/Midway">(GMT-11:00) International Date Line West</option>
        <option value="Pacific/Midway">(GMT-11:00) Midway Island</option>
        <option value="Pacific/Pago_Pago">(GMT-11:00) Samoa</option>
        <option value="America/Tijuana">(GMT-08:00) Tijuana</option>
        <option value="America/Chihuahua">(GMT-07:00) Chihuahua</option>
        <option value="America/Mazatlan">(GMT-07:00) Mazatlan</option>
        <option value="America/Guatemala">(GMT-06:00) Central America</option>
        <option value="America/Mexico_City">(GMT-06:00) Guadalajara</option>
        <option value="America/Mexico_City">(GMT-06:00) Mexico City</option>
        <option value="America/Monterrey">(GMT-06:00) Monterrey</option>
        <option value="America/Regina">(GMT-06:00) Saskatchewan</option>
        <option value="America/Bogota">(GMT-05:00) Bogota</option>
        <option value="America/Lima">(GMT-05:00) Lima</option>
        <option value="America/Lima">(GMT-05:00) Quito</option>
        <option value="America/Caracas">(GMT-04:30) Caracas</option>
        <option value="America/Halifax">(GMT-04:00) Atlantic Time (Canada)</option>
        <!-- .... -->
      </optgroup>
    </select>

## Planned 

* More grouping options
* Not just US first
* Formatting options
* Sorting options
