#
# Rocketeer
# Copyright (C) 2011-2013 Jack Polgar
# All Rights Reserved
# http://github.com/nirix/rocketeer
#
# Rocketeer is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation; version 3 only.
#
# Rocketeer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Rocketeer. If not, see <http://www.gnu.org/licenses/>.
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
        options[:for] = _id(options[:for]) if options[:for]
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
          :name => _name(name).to_s
        }.merge(options)

        # If the ID is not set, use the field name
        if !options.key? :id
          options[:id] = _id(name).to_s
        end

        # Remove the ID if it's false
        options.delete(:id) if options[:id] === false

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
        html = ["<select name=\"#{_name(name).to_s}\" id=\"#{_id(name).to_s}\">"]

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
      # Checkbox
      #
      # @param [Mixed] name
      # @param [Hash]  options
      #
      # @return [String]
      #
      # @since 0.6
      #
      def checkbox(name, options = {})
        if options.key?(:checked)
          options.delete(:checked) if !options[:checked]
        end
        input_field name, options.merge({ :type => 'checkbox' })
      end

      ##
      # Radio button
      #
      # @param [Mixed] name
      # @param [Hash]  options
      #
      # @return [String]
      #
      # @since 0.6
      #
      def radio_button(name, options = {})
        input_field name, options.merge({ :type => 'radio', :id => false })
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
          :id => _id(name).to_s,
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
          if name.is_a?(Array)
            return name = "#{name[0]}[#{name[1]}]"
          end

          name
        end

        def _id(name)
          if name.is_a?(Array)
            return "#{name[0]}_#{name[1]}"
          end

          name
        end
    end
  end
end
