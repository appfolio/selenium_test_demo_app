source 'https://rubygems.org' do

  # It's good to keep these gem versions in step with the versions used in
  # apm_bundle/apps/property/Gemfile
  module PropertyGemVersions
    AE_PAGE_OBJECTS    = '2.0.0'
    MINITEST           = '5.8.0'
    RAILS              = '4.2.5.2'
    SELENIUM_WEBDRIVER = '2.53.0'
    SQLITE3            = '1.3.11'
  end


  gem 'rails',   PropertyGemVersions::RAILS
  gem 'sqlite3', PropertyGemVersions::SQLITE3

  group :test do
    gem 'ae_page_objects',    PropertyGemVersions::AE_PAGE_OBJECTS
    gem 'minitest',           PropertyGemVersions::MINITEST
    gem 'selenium-webdriver', PropertyGemVersions::SELENIUM_WEBDRIVER
  end

  group :development do
    # (Copied from apm_bundle/apps/property/Gemfile)
    #
    # Incompatibilities have developed between versions of pry-byebug and
    # pry-remote. Through experimentation and research, I've determined that by
    # just constraining pry-byebug to '< 2' our whole pry ecosystem plays nicely
    # together again. I chose '< 2' because it's the least restrictive
    # constraint that gets us what we want. Here are some discussions of the
    # compatibility issues:
    #   * https://github.com/deivid-rodriguez/pry-byebug/issues/33
    #   * https://github.com/Mon-Ouie/pry-remote/issues/61
    gem 'pry'
    gem 'pry-byebug', '< 2'
    gem 'pry-editline'
    gem 'pry-rails'
    gem 'pry-remote'
  end
end
