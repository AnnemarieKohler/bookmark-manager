ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require './app/app'
require 'tilt/erb'
require 'database_cleaner'
require 'features/web_helper'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'capybara'
require 'rspec'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.include Capybara::DSL
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.backtrace_exclusion_patterns = [
    /\/lib\d*\/ruby\//,
    /bin\//,
    /gems/,
    /spec\/spec_helper\.rb/,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]
  # For full stack trace do rspec --backtrace
end
