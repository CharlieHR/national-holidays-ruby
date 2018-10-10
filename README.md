# National Holidays for Ruby

## Where does this data come from?

The national holidays data used in this gem comes from the [national-holidays-config](https://github.com/CharlieHR/national-holidays-config) project.

## Installation

    gem install national_holidays

## Development

This project uses git submodules, so the first time you clone the repository you will need to run:

    git submodule init

Then to keep the config up to date use:

    git pull --recurse-submodules

And to actually pull in new config use:

    git submodule foreach git pull origin master

## Usage

    require 'national_holidays'

    NationalHolidays.load! # optionally pre-load all data

    NationalHolidays.countries.each do |country|
      country.regions.each do |region|
        holidays = region.all_holidays.select { |h| h.date.day == 18 && h.date.month == 11 }

        if holidays.any?
          puts "My birthday is a public holiday in #{country.name}: #{holidays.first.names.except(:en).first.last}!"
        end
      end
    end

    # My birthday is a public holiday in Haiti: Vertières Day!
    # My birthday is a public holiday in Iran (Islamic Republic of): Martyrdom of Imam Reza!
    # My birthday is a public holiday in Latvia: Latvijas Republikas proklamēšanas diena!
    # My birthday is a public holiday in Mexico: Revolución Mexicana!

## Country

    country = NationalHolidays::Country.new(:gb)

    puts country.code
    # gb

    puts country.name
    # United Kingdom of Great Britain and Northern Ireland

    puts country.regions.map(&:name)
    # ["England", "Wales", "Scotland", "Northern Ireland"]

Country names come from https://github.com/hexorx/countries

Region names come from https://github.com/CharlieHR/national-holidays-config

## Region

    region = NationalHolidays::Region.new(:united_states14)

    puts region.code
    # :united_states14

    puts region.name
    # Illinois

    date = Date.new(2018, 1, 1)

    puts region.all_holidays.count
    # 374

    puts region.holidays_on_or_before(date).count
    # 87
    puts region.holidays_before(date).count
    # 86

    puts region.holidays_on_or_after(date).count
    # 288
    puts region.holidays_after(date).count
    # 287

    puts region.holidays_between(date, date).count
    # 1

## Holiday

    holiday.names
    # {
    #   en: "New Year's Day",
    #   es: "Año Nuevo"
    # }

    holiday.date
    # Date.new(2018, 1, 1)

    holiday.public_holiday?
    # true

In the future we hope to also support non-public holidays, ie. days which are notable but do not mean that people get the day of work.

## Who are we?

We run [CharlieHR](https://www.charliehr.com) where knowing about public and national holidays helps us calculate time off for 1000s of companies.
