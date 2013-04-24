require 'rubygems'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'castiel'
require 'rspec'
require 'time'

RSpec.configure do |config|
  # see spec.opts
end