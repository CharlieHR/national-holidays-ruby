require 'minitest/autorun'
require 'national_holidays'

class NationalHolidaysCountryTest < Minitest::Test
  def test_code
    assert_equal :gb, NationalHolidays::Country.new(:gb).code
    assert_equal :gb, NationalHolidays::Country.new('gb').code
  end

  def test_name
    assert_equal 'United Kingdom of Great Britain and Northern Ireland', NationalHolidays::Country.new(:gb).name
  end

  def test_regions
    assert_equal [:united_kingdom01, :united_kingdom02, :united_kingdom03, :united_kingdom04], NationalHolidays::Country.new(:gb).regions.map(&:code)
  end
end
