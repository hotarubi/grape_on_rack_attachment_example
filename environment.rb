$:.unshift File.dirname(__FILE__)
env = (ENV['RACK_ENV'] || :development)

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'bundler'
Bundler.require :default, env.to_sym
require 'erb'

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Dir["lib/**/*.rb"].each {|f| require f}

module Application
  include ActiveSupport::Configurable
end

Application.configure do |config|
  config.root               = File.dirname(__FILE__)
  config.env                = ActiveSupport::StringInquirer.new(env.to_s)
end

Dir["config/initializers/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/../../lib/exts/grape/**/*.rb"].each {|f| require f}
