# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "date"
require 'simplecov'
SimpleCov.start 

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative '../lib/reservation_dates'
require_relative '../lib/reservation'
require_relative '../lib/reservation_manager'
