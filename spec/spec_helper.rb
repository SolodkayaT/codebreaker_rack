require_relative '../lib/game.rb'
require_relative '../lib/racker.rb'
require 'rack'
require 'capybara/rspec'

app_content = File.read(File.expand_path('../../config.ru', __FILE__))
Capybara.app = eval "Rack::Builder.new {( #{app_content}\n )}"

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
  
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Capybara::DSL

end
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
