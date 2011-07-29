#
# Rocketeer
# Copyright (C) 2011 Jack Polgar
# All Rights Reserved
# http://github.com/nirix/rockets
#
# Relased under the BSD 3-clause / New BSD License
# Please see the COPYING file for details.
#

#:nodoc:
module Sinatra
  #:nodoc:
  module FormHelper
    ##
    # Input field builder
    #
    # Useage:
    #
    #    input_field :my_field, :type => 'text'
    #
    # @param [Mixed] name    The name of the field
    # @param [Hash]  options The fields options
    # @author Jack Polgar
    # @since 0.1
    #
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
    
    ##
    # Text field builder
    #
    # Useage:
    #    text_field :my_field, :class => 'text', :value => 'my value'
    #
    # @param [Mixed] name    The name of the field
    # @param [Hash]  options The fields options
    # @author Jack Polgar
    # @since 0.1
    #
    def text_field(name, options = {})
      input_field name, options.merge({:type => 'text'})
    end
    
    ##
    # Password field builder
    #
    # Useage:
    #    pasword_field :my_field, :class => 'text', :value => 'my value'
    #
    # @param [Mixed] name    The name of the field
    # @param [Hash]  options The fields options
    # @author Jack Polgar
    # @since 0.1
    #
    def password_field(name, options = {})
      input_field name, options.merge({:type => 'password'})
    end
    
    ##
    # Email field builder
    #
    # Useage:
    #    email_field :my_field, :class => 'text', :value => 'my value'
    #
    # @param [Mixed] name    The name of the field
    # @param [Hash]  options The fields options
    # @author Jack Polgar
    # @since 0.1
    #
    def email_field(name, options = {})
      input_field name, options.merge({:type => 'email'})
    end
    
    ##
    # Select box builder
    #
    # Useage:
    #    select_box :my_field, [['Hello', 1], ['World', 2]], 2 
    #
    # @param [Mixed] name     The name of the field
    # @param [Array] rows     Array of the select field options
    # @param [Mixed] selected Value of the selected option
    # @author Jack Polgar
    # @since 0.1
    #
    def select_box(name, rows, selected = nil)
      if name.class == Array
        name = "#{name[0]}[#{name[1]}]"
      end
      
      html = ["<select name=\"#{name.to_s}\" id=\"#{name.to_s}\">"]
      
      rows.each do |row|
        if row[1] == selected
          selected_html = ' selected'
        else
          selected_html = ''
        end
        html.push "  <option value=\"#{row[1]}\" #{selected_html}>#{row[0]}</option>"
      end
      
      html.push "</select>\n"
      return html.join("\n")
    end
    
    ##
    # Text area builder
    #
    # Useage:
    #    textarea :my_field, :class => 'text', :value => 'my value'
    #
    # @param [Mixed] name    The name of the field
    # @param [Hash]  options The fields options
    # @author Jack Polgar
    # @since 0.1
    #
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