require 'national_holidays/country'
require 'national_holidays/region'

class NationalHolidays
  UnknownCountryError = Class.new(StandardError)
  UnknownRegionError = Class.new(StandardError)

  def self.load!
    Region.all.each(&:name)
    true
  end

  def self.countries
    Country.all
  end

  def self.regions
    Region.all
  end

  def self.regions_to_public_holiday_count_for_year(year)
    Region.all.sort_by(&:code).map do |region|
      [region.code, region.holidays_between(Date.new(year, 1, 1), Date.new(year, 12, 31)).count]
    end.to_h
  end

  def self.config_directory
    File.expand_path('../national-holidays-config/conf', __dir__)
  end
end
