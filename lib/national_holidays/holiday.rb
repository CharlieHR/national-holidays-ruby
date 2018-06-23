class NationalHolidays
  class Holiday
    attr_reader :names, :date

    def initialize(names, date, public_holiday)
      @names = names
      @date = date
      @public_holiday = public_holiday
    end

    def public_holiday?
      @public_holiday
    end
  end
end
