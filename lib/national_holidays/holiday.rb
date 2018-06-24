# frozen_string_literal: true

class NationalHolidays
  class Holiday
    attr_reader :names, :date

    def initialize(names, date, public_holiday)
      @names = names.map { |k, v| [k.to_sym, v] }.to_h
      @date = Date.parse(date.to_s)
      @public_holiday = public_holiday
    end

    def public_holiday?
      @public_holiday
    end
  end
end
