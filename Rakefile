# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require "rails/test_unit/runner"

SeleniumTestDemoApp::Application.load_tasks

namespace :test do

  desc 'Run selenium tests'
  task :selenium => "db:abort_if_pending_migrations" do
    $: << "test"
    Rails::TestUnit::Runner.rake_run(['test/selenium/**/*_test.rb'])
  end
end

Rake::Task[:test].enhance ['test:selenium']
