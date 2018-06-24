# frozen_string_literal: true

require 'national_holidays/holiday'

require 'yaml'

class NationalHolidays
  class Region
    attr_reader :code

    def self.all
      Dir.glob("#{NationalHolidays.config_directory}/*/*.yml").map do |region_filename|
        new(File.basename(region_filename).sub(/\.yml/, ''))
      end.sort_by(&:code)
    end

    def initialize(code)
      @code = code.to_sym
    end

    def name
      config.fetch('name')
    end

    def all_holidays
      holidays
    end

    def holidays_on_or_before(date)
      holidays(nil, date)
    end

    def holidays_before(date)
      holidays(nil, date.prev_day)
    end

    def holidays_on_or_after(date)
      holidays(date, nil)
    end

    def holidays_after(date)
      holidays(date.next_day, nil)
    end

    def holidays_between(start_date, end_date)
      holidays(start_date, end_date)
    end

    private

    def holidays(start_date = nil, end_date = nil)
      start_date = Date.parse(start_date.to_s).to_s if start_date
      end_date = Date.parse(end_date.to_s).to_s if end_date

      config.fetch('years').flat_map do |_, holidays|
        holidays.map do |holiday_config|
          holiday_config_date = holiday_config.fetch('date')

          next if start_date && start_date > holiday_config_date
          next if end_date && end_date < holiday_config_date

          Holiday.new(*holiday_config.values_at('names', 'date', 'public_holiday'))
        end
      end.compact
    end

    @cache = {}
    class << self
      attr_reader :cache
    end

    def config
      return self.class.cache[code] if self.class.cache.key?(code)

      filename = Dir.glob("#{NationalHolidays.config_directory}/*/*.yml").sort.find do |f|
        File.basename(f) == "#{code}.yml"
      end

      raise NationalHolidays::UnknownRegionError, "Unknown region: #{code}" unless filename

      self.class.cache[code] = YAML.safe_load(File.read(filename))
    end
  end
end
