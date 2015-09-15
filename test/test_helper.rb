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

module BlogPosts
  class Site < AePageObjects::Site
  end
end

BlogPosts::Site.initialize!
Capybara.current_driver = Capybara.javascript_driver
