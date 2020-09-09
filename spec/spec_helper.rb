require 'rspec'
require 'rack/test'
require_relative '../app.rb'

set :environment, :test

module RSpecMixin
  include Rack::Test::Methods

  def app
    App
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end