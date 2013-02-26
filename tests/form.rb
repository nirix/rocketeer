require "bacon"
require "bacon/colored_output"
require "sinatra"
require "rack/test"

require File.expand_path('../../lib/rocketeer/helpers/html', __FILE__)
require File.expand_path('../../lib/rocketeer/helpers/form', __FILE__)

set :environment, :test

helpers do
  include Rocketeer::Helpers::HTML
  include Rocketeer::Helpers::Form
end

#########################################
# Label
get '/form/label' do
  label 'Username', for: [:user, :username], class: 'control-label'
end

#########################################
# Text field
get '/form/text_field' do
  text_field [:user, :username], class: 'error', value: 'Rocketeer'
end
#########################################
# Password field
get '/form/password_field' do
  password_field [:user, :password], class: 'error'
end

#########################################
# Email field
get '/form/email_field' do
  email_field [:user, :email], class: 'error', value: 'user@example.com'
end

#########################################
# Select box
get '/form/select_box' do
  select_box [:user, :group], [['Admin', 1], ['Registered', 2]], 2
end

#########################################
# Check box
get '/form/checkbox' do
  checkbox [:user, :is_admin], value: 1, checked: true
end

#########################################
# Radio button
get '/form/radio_button' do
  radio_button [:issue, :status], value: 1, checked: true
end

#########################################
# Textarea
get '/form/textarea' do
  textarea [:issue, :info], value: 'Something', class: 'error'
end

#########################################
# Tests

describe 'Form Helpers' do
  extend Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # Label
  it "label 'Username', for: [:user, :username], class: 'control-label'" do
    get '/form/label'
    last_response.body.should.equal '<label for="user_username" class="control-label">Username</label>'
  end

  # Text field
  it "text_field [:user, :username], class: 'error', value: 'Rocketeer'" do
    get '/form/text_field'
    last_response.body.should.equal '<input name="user[username]" class="error" value="Rocketeer" type="text" id="user_username">'
  end

  # Password field
  it "password_field [:user, :password], class: 'error'" do
    get '/form/password_field'
    last_response.body.should.equal '<input name="user[password]" class="error" type="password" id="user_password">'
  end

  # Email field
  it "email_field [:user, :email], class: 'error', value: 'user@example.com'" do
    get '/form/email_field'
    last_response.body.should.equal '<input name="user[email]" class="error" value="user@example.com" type="email" id="user_email">'
  end

  # Select box
  it "select_box [:user, :group], [['Admin', 1], ['Registered', 2]], 2" do
    get '/form/select_box' do
      last_response.body.should.equal '<select name="user[group]" id="user_group">' + "\n" \
                                      '  <option value="1">Admin</option>' + "\n" \
                                      '  <option value="2" selected>Registered</option>' + "\n" \
                                      '</select>' + "\n"
    end
  end

  # Checkbox
  it "checkbox [:user, :is_admin], value: 1, checked: true" do
    get '/form/checkbox'
    last_response.body.should.equal '<input name="user[is_admin]" value="1" checked type="checkbox" id="user_is_admin">'
  end

  # Radio button
  it "radio_button [:issue, :status], value: 1, checked: true" do
    get '/form/radio_button'
    last_response.body.should.equal '<input name="issue[status]" value="1" checked type="radio">'
  end

  # Textarea
  it "textarea [:issue, :info], value: 'Something', class: 'error'" do
    get '/form/textarea'
    last_response.body.should.equal '<textarea id="issue_info" name="issue[info]" class="error">Something</textarea>'
  end
end
