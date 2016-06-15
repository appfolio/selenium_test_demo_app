ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'ae_page_objects'

Dir[File.dirname(__FILE__) + '/page_objects/**/*.rb'].each {|file| require file }

class ActiveSupport::TestCase
  fixtures :all
  self.use_transactional_fixtures = true
end

# Begin selenium stuffs:
#
# http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

# end Selenium stuffs

Capybara.current_driver = Capybara.javascript_driver

# jf: We need a custom router. We can reuse the logic from
# AePageObjects::BasicRouter, but we need to normalize the input to
# #path_recognizes_url? and the output from #generate_path.
class SeleniumTestDemoAppRouter < AePageObjects::BasicRouter

  def path_recognizes_url?(path, url)
    super without_leading_slash(path), without_leading_slash(url)
  end

  def generate_path(named_route, *args)
    with_leading_slash super(named_route, *args)
  end

  private

  def without_leading_slash(stringable)
    stringable.to_s.gsub(%r{^/+}, '')
  end

  def with_leading_slash(stringable)
    "/#{without_leading_slash(stringable)}"
  end
end
AePageObjects.default_router = SeleniumTestDemoAppRouter.new
