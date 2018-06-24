require 'minitest/autorun'
require 'national_holidays'

class NationalHolidaysTest < Minitest::Test
  def test_load
    assert_equal true, NationalHolidays.load!
  end

  def test_countries
    assert_equal :ae, NationalHolidays.countries.first.code
    assert_equal 'South Africa', NationalHolidays.countries.last.name
  end

  def test_regions
    assert_equal :angola01, NationalHolidays.regions.first.code
    assert_equal 'Vietnam', NationalHolidays.regions.last.name
  end

	def test_regions_to_public_holiday_count_for_year
    assert_equal 8, NationalHolidays.regions_to_public_holiday_count_for_year(2017).fetch(:united_kingdom01)
	end
end
