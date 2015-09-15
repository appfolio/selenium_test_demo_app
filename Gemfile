source 'https://rubygems.org' do

  # It's good to keep these gem versions in step with the versions used in
  # apm_bundle/apps/property/Gemfile
  APM_PROPERTY_RAILS_VERSION    = '4.0.12'
  APM_PROPERTY_MINITEST_VERSION = '4.7.5'

  gem 'rails', APM_PROPERTY_RAILS_VERSION
  gem 'sqlite3'

  group :test do
    gem 'ae_page_objects'
    gem 'minitest', APM_PROPERTY_MINITEST_VERSION
    gem 'selenium-webdriver'
  end

  group :development do
    gem 'pry'
    gem 'pry-rails'
    gem 'pry-remote'
  end
end
