require 'minitest/autorun'
require 'national_holidays'

class NationalHolidaysHolidayTest < Minitest::Test
  def holiday
    NationalHolidays::Holiday.new(
      {
        'en' => "New Year's Day",
        'es' => 'Año Nuevo',
      },
      '2018-01-01',
      true
    )
  end

  def test_names
    assert_equal "New Year's Day", holiday.names.fetch(:en)
    assert_equal 'Año Nuevo', holiday.names.fetch(:es)
  end

  def test_date
    assert_equal Date.new(2018, 1, 1), holiday.date
  end

  def test_public_holiday
    assert holiday.public_holiday?
  end
end
