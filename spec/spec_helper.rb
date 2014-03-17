__dir__ ||= File.expand_path("../", __FILE__)
lib = File.expand_path("../lib", __dir__)
$LOAD_PATH.push(lib)
require "gyapbox"
require "webmock/rspec"

RSpec.configure do |config|
end
