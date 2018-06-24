require 'minitest/autorun'
require 'national_holidays'

class NationalHolidaysRegionTest < Minitest::Test
  def test_code
    assert_equal :united_kingdom01, NationalHolidays::Region.new(:united_kingdom01).code
    assert_equal :united_kingdom01, NationalHolidays::Region.new('united_kingdom01').code
  end

  def test_name
    assert_equal 'England', NationalHolidays::Region.new(:united_kingdom01).name
  end

  def test_all_holidays
    refute_empty NationalHolidays::Region.new(:united_kingdom01).all_holidays.select { |holiday| holiday.date == Date.new(2011, 1, 3) }
    refute_empty NationalHolidays::Region.new(:united_kingdom01).all_holidays.select { |holiday| holiday.date == Date.new(2040, 1, 2) }
  end

  def test_holidays_on_or_before
    refute_empty NationalHolidays::Region.new(:united_kingdom01).holidays_on_or_before(Date.new(2018, 1, 1))
    assert_empty NationalHolidays::Region.new(:united_kingdom01).holidays_on_or_before(Date.new(2018, 1, 1)).select { |holiday| holiday.date > Date.new(2018, 1, 1) }
    assert_equal Date.new(2018, 1, 1), NationalHolidays::Region.new(:united_kingdom01).holidays_on_or_before(Date.new(2018, 1, 1)).last.date
  end

  def test_holidays_before
    refute_empty NationalHolidays::Region.new(:united_kingdom01).holidays_before(Date.new(2018, 1, 1))
    assert_empty NationalHolidays::Region.new(:united_kingdom01).holidays_before(Date.new(2018, 1, 1)).select { |holiday| holiday.date >= Date.new(2018, 1, 1) }
    assert_equal Date.new(2017, 12, 26), NationalHolidays::Region.new(:united_kingdom01).holidays_before(Date.new(2018, 1, 1)).last.date
  end

  def test_holidays_on_or_after
    refute_empty NationalHolidays::Region.new(:united_kingdom01).holidays_on_or_after(Date.new(2018, 1, 1))
    assert_empty NationalHolidays::Region.new(:united_kingdom01).holidays_on_or_after(Date.new(2018, 1, 1)).select { |holiday| holiday.date < Date.new(2018, 1, 1) }
    assert_equal Date.new(2018, 1, 1), NationalHolidays::Region.new(:united_kingdom01).holidays_on_or_after(Date.new(2018, 1, 1)).first.date
  end

  def test_holidays_after
    refute_empty NationalHolidays::Region.new(:united_kingdom01).holidays_after(Date.new(2018, 1, 1))
    assert_empty NationalHolidays::Region.new(:united_kingdom01).holidays_after(Date.new(2018, 1, 1)).select { |holiday| holiday.date <= Date.new(2018, 1, 1) }
    assert_equal Date.new(2018, 3, 30), NationalHolidays::Region.new(:united_kingdom01).holidays_after(Date.new(2018, 1, 1)).first.date
  end

  def test_holidays_between
    assert_equal ['Good Friday', 'Easter Monday', 'Royal Wedding Day'], NationalHolidays::Region.new(:united_kingdom01).holidays_between(Date.new(2011, 4, 1), Date.new(2011, 4, 30)).map { |holiday| holiday.names.fetch(:en) }
  end
end
