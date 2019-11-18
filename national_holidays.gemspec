# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'national_holidays'
  s.version     = '1.7.4'
  s.date        = '2019-11-18'
  s.summary     = 'National Holidays for 83 countries'
  s.description = 'Uses config from the national-holidays-config project to provide access to national holiday data across 83 countries'
  s.authors     = ['Alex Balhatchet']
  s.email       = 'alex@balhatchet.net'
  s.homepage    = "https://github.com/CharlieHR/national-holidays-ruby"
  s.license     = 'MIT'
  s.files       = Dir.glob("{bin,lib,test}/**/*") + Dir.glob("national-holidays-config/conf/*/*.yml") + %w(LICENSE.txt README.md Rakefile)

  s.add_runtime_dependency 'countries', '~>2.1'

  s.add_development_dependency 'minitest', '~> 5.11'
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'rubocop', '~> 0.56'
end
