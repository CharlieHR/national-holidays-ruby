# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'national_holidays'
  s.version     = '0.0.1'
  s.date        = '2018-06-23'
  s.summary     = 'National Holidays for 74 countries'
  s.description = 'Uses config from the national-holidays-config project to provide access to national holiday data across 74 countries'
  s.authors     = ['Alex Balhatchet']
  s.email       = 'alex@balhatchet.net'
  s.files       = ['lib/national_holidays.rb']
  s.license     = 'MIT'

  s.add_runtime_dependency 'countries', '~>2.1'

  s.add_development_dependency 'minitest', '~> 5.11'
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'rubocop', '~> 0.56'
end
