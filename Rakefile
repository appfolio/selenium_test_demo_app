# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SeleniumTestDemoApp::Application.load_tasks

namespace :test do

  desc 'Run selenium tests'
  Rake::TestTask.new selenium: 'db:abort_if_pending_migrations' do |task|
    task.libs << 'test'
    task.pattern = 'test/selenium/**/*_test.rb'
  end
end

Rake::Task[:test].enhance ['test:selenium']
