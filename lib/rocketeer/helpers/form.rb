#
# Rocketeer
# Copyright (C) 2011 Jack Polgar
# All Rights Reserved
# http://github.com/nirix/rockets
#
# Relased under the BSD 3-clause / New BSD License
# Please see the COPYING file for details.
#

module Sinatra
  module FormHelper
    def input_field(name, options = {})
      if name.class == Array
        name = "#{name[0]}[#{name[1]}]"
      end
      defaults = {
        :id => name.to_s,
        :name => name.to_s
      }
      
      html_options = []
      options = defaults.merge(options)
      options.each do |k, v|
        html_options.push "#{k}=\"#{v}\""
      end
      
      "<input #{html_options.join(' ')}>"
    end
    
    def text_field(name, options = {})
      input_field name, options.merge({:type => 'text'})
    end
    
    def password_field(name, options = {})
      input_field name, options.merge({:type => 'password'})
    end
    
    def email_field(name, options = {})
      input_field name, options.merge({:type => 'email'})
    end
    
    def select_box(name, options, selected = nil)
      if name.class == Array
        name = "#{name[0]}[#{name[1]}]"
      end
      
      html = ["<select name=\"#{name.to_s}\" id=\"#{name.to_s}\">"]
      
      options.each do |option|
        if option[1] == selected
          selected_html = ' selected'
        else
          selected_html = ''
        end
        html.push "  <option value=\"#{option[1]}\" #{selected_html}>#{option[0]}</option>"
      end
      
      html.push "</select>\n"
      return html.join("\n")
    end
    
    def textarea(name, options = {})
      if name.class == Array
        name = "#{name[0]}[#{name[1]}]"
      end
      defaults = {
        :id => name.to_s,
        :name => name.to_s
      }
      if options[:value]
        value = options[:value]
        options[:value] = nil
      else
        value = ''
      end
      
      html_options = []
      options = defaults.merge(options)
      options.each do |k, v|
        next if v == nil
        html_options.push "#{k}=\"#{v}\""
      end
      
      "<textarea #{html_options.join(' ')}>#{value}</textarea>"
    end
  end
  
  helpers FormHelper
end