require 'rubygems'
require 'bundler/setup'

require 'nilly_vanilly'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  # some (optional) config here
end