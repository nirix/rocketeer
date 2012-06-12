#
# Rocketeer
# Copyright (C) 2011 Jack Polgar
# All Rights Reserved
# http://github.com/nirix/rockets
#
# Relased under the BSD 3-clause / New BSD License
# Please see the COPYING file for details.
#

module Rocketeer
  module Helpers
    module Form
      ##
      # Label tag builder
      #
      # @author: Jack Polgar
      # @since 0.5
      #
      # @example:
      #   label 'Username', :for => :username
      #
      # @param [String] Text for thelabel
      # @param [Hash]   Options
      #
      # @return [String]
      #
      def label(text, options = {})
        options[:for] = _name(options[:for]) if options[:for]
        "<label#{HTML.attributes(options)}>#{text}</label>"
      end

      ##
      # Input field builder
      #
      # @example:
      #    input_field :my_field, :type => 'text'
      #
      # @param [Mixed] name    The name of the field
      # @param [Hash]  options The fields options
      # @author Jack Polgar
      # @since 0.1
      #
      def input_field(name, options = {})
        options = {
          :id => _name(name).to_s,
          :name => _name(name).to_s
        }.merge(options)
        
        "<input#{HTML.attributes(options)}>"
      end
      
      ##
      # Text field builder
      #
      # @example:
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
      # @example:
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
      # @example:
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
      # @example:
      #    select_box :my_field, [['Hello', 1], ['World', 2]], 2 
      #
      # @param [Mixed] name     The name of the field
      # @param [Array] rows     Array of the select field options
      # @param [Mixed] selected Value of the selected option
      # @author Jack Polgar
      # @since 0.1
      #
      def select_box(name, rows, selected = nil)
        name = _name(name)
        html = ["<select name=\"#{name.to_s}\" id=\"#{name.to_s}\">"]
        
        rows.each do |row|
          if row[1] == selected
            selected_html = ' selected'
          else
            selected_html = ''
          end
          html.push "  <option value=\"#{row[1]}\"#{selected_html}>#{row[0]}</option>"
        end
        
        html.push "</select>\n"
        return html.join("\n")
      end
      
      ##
      # Text area builder
      #
      # @example:
      #    textarea :my_field, :class => 'text', :value => 'my value'
      #
      # @param [Mixed] name    The name of the field
      # @param [Hash]  options The fields options
      # @author Jack Polgar
      # @since 0.1
      #
      def textarea(name, options = {})
        options = {
          :id => name.to_s,
          :name => _name(name).to_s
        }.merge(options)

        if options[:value]
          value = options[:value]
          options[:value] = nil
        else
          value = ''
        end
        
        "<textarea#{HTML.attributes(options)}>#{value}</textarea>"
      end

      ##
      # Creates a submit button (using <button>)
      #
      # @author Jack Polgar
      # @since 0.5
      #
      # @param [String] text
      # @param [Hash]   options HTML attributes
      #
      # @return [String]
      #
      def submit_button(text, options = {})
        "<button type=\"submit\"#{HTML.attributes(options)}>#{text}</button>"
      end

      private
        def _name(name)
          if name.class == Array
            name = "#{name[0]}[#{name[1]}]"
          else
            name
          end
        end
    end
  end
end