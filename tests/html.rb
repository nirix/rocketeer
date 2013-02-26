require "bacon"
require "bacon/colored_output"
require "sinatra"
require "rack/test"

require File.expand_path('../../lib/rocketeer/helpers/html', __FILE__)

set :environment, :test

helpers do
  include Rocketeer::Helpers::HTML
end

#########################################
# link_to
get '/html/link_to' do
  link_to 'Delete User', '/users/1/delete', class: 'btn-delete'
end

#########################################
# link_to_unless_current
get '/html/link_to_unless_current' do
  link_to_unless_current 'link_to_unless_current', '/html/link_to_unless_current'
end

get '/html/link_to_unless_current/2' do
  link_to_unless_current 'link_to_unless_current', '/html/link_to_unless_current', class: 'test'
end

#########################################
# Tests

describe 'HTML Helpers' do
  extend Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # link_to
  it "link_to" do
    get '/html/link_to'
    last_response.body.should.equal '<a class="btn-delete" href="/users/1/delete">Delete User</a>'
  end

  # link_to_unless_current
  it "link_to_unless_current" do
    get '/html/link_to_unless_current'
    current = last_response.body.should.equal('link_to_unless_current')

    get '/html/link_to_unless_current/2'
    not_current = last_response.body.should.equal('<a class="test" href="/html/link_to_unless_current">link_to_unless_current</a>')

    current and not_current
  end
end
