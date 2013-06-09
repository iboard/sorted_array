require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler/setup'

require 'rspec/expectations'
require 'rspec/mocks'
require 'sorted_array' # and any other gems you need

SORTER_TEST_STORE = '/tmp/sorter_spec.pstore'
ARRAY_TEST_STORE  = '/tmp/sorted_array_spec.pstore'

RSpec.configure do |c|
  c.include SortedArray
  File.unlink(SORTER_TEST_STORE) if File.exists?(SORTER_TEST_STORE)
  File.unlink(ARRAY_TEST_STORE) if File.exists?(ARRAY_TEST_STORE)
end

