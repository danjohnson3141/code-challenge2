# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'colorize'
require 'capybara/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Bullet = "\u2022"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

def step_complete
  puts " \u2713".blue
end

def bullet
  print Bullet.white
end

RSpec.configure do |config|
  config.include ValidUserHelper, :type => :controller
  config.include ValidUserRequestHelper, :type => :request
  config.before(:suite) do
    puts "Before suite setup:".yellow
  end

  config.after(:suite) do
    puts
    puts "After suite cleanup:".yellow
  end 

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods

  config.include RSpec::Rails::RequestExampleGroup

end
