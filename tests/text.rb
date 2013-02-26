require "bacon"
require "bacon/colored_output"
require "sinatra"
require "rack/test"

require File.expand_path('../../lib/rocketeer/helpers/text', __FILE__)

set :environment, :test

helpers do
  include Rocketeer::Helpers::Text
end

#########################################
# shorten_string
get '/text/shorten_string' do
  shorten_string 'This is a test', 10
end

#########################################
# Tests

describe 'Text Helpers' do
  extend Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # shorten_string
  it "shorten_string" do
    get '/text/shorten_string'
    last_response.body.should.equal 'This is...'
  end
end
