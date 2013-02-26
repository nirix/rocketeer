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
  link_to_unless_current 'link_to_unless_current', '/html/link_to_unless_current/2', class: 'test'
end

get '/html/link_to_unless_current/2' do
  link_to_unless_current 'link_to_unless_current', '/html/link_to_unless_current/2', class: 'test'
end

#########################################
# link_to_if
get '/html/link_to_if' do
  link_to_if true, 'True', '/html/link_to_if', class: 'test'
end

get '/html/link_to_if/2' do
  link_to_if false, 'False', '/html/link_to_if', class: 'test'
end

#########################################
# css_link_tag
get '/html/css_link_tag' do
  css_link_tag '/assets/css/print.css', :print
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
  it "link_to_unless_current - link" do
    get '/html/link_to_unless_current'
    last_response.body.should.equal('<a class="test" href="/html/link_to_unless_current/2">link_to_unless_current</a>')
  end

  it "link_to_unless_current - no link" do
    get '/html/link_to_unless_current/2'
    last_response.body.should.equal('link_to_unless_current')
  end

  # link_to_if
  it "link_to_if - link" do
    get '/html/link_to_if'
    last_response.body.should.equal '<a class="test" href="/html/link_to_if">True</a>'
  end

  it "link_to_if - no link" do
    get '/html/link_to_if/2'
    last_response.body.should.equal 'False'
  end

  # css_link_tag
  it "css_link_tag" do
    get '/html/css_link_tag'
    last_response.body.should.equal "<link rel=\"stylesheet\" href=\"/assets/css/print.css?#{Time.now.to_i}\" media=\"print\" />"
  end
end
