Bundler.require(:default, :test)
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'minitest/autorun'