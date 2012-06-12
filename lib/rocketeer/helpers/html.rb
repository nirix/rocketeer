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
    module HTML
      ##
      # Creates a link to the specified URL with the specified text
      #
      # @example:
      #    link_to 'Apple', 'http://apple.com/au'
      #
      # @param [String] text The text for the link
      # @param [String] the_url The URL to link to
      # @param [Hash] options Options for the link
      # @author Jack Polgar
      # @since 0.1
      #
      def link_to(text, url, options = {})
        options = options.merge({
          :href => url ? url : request.path_info
        })
        if options[:confirm]
          options[:"data-confirm"] = options[:confirm]
          options[:confirm] = nil
        end
        if options[:remote]
          options[:"data-remote"] = options[:remote]
          options[:remote] = nil
        end
        
        html_options = []
        options.each do |k, v|
          pass if v === nil
          html_options.push "#{k.to_s}=\"#{v.to_s}\""
        end
        
        "<a #{html_options.join(' ')}>#{text}</a>"
      end
      
      ##
      # Creates a link to the specified URL unless the request matches the URL.
      #
      # @example:
      #    link_to_unless_current 'Google', 'http://google.com.au'
      #
      # @param [String] text The text for the link
      # @param [String] the_url The URL to link to
      # @param [Hash] options Options for the link
      # @author Jack Polgar
      # @since 0.1
      #
      def link_to_unless_current(text, url, options = {})
        if request.path_info == url
          text
        else
          link_to text, url, options
        end
      end
      
      ##
      # Creates a link to the specified URL if the condition is met.
      #
      # @example:
      #    link_to_if Time.now.year == 2011, 'Google', 'http://google.com.au'
      #
      # @param [Boolean] condition The condition to check
      # @param [String] text The text for the link
      # @param [String] the_url The URL to link to
      # @param [Hash] options Options for the link
      # @author Jack Polgar
      # @since 0.3
      #
      def link_to_if(condition, text, url, options = {})
        if condition
          link_to text, url, options = {}
        else
          text
        end
      end
      
      ##
      # Returns the code for linking CSS style sheets.
      #
      # @example:
      #    css_inc_tag '/assets/css/master.css'
      #    css_inc_tag '/assets/css/print.css', 'screen'
      #
      # @param [String] url The URL of the stylesheet
      # @param [String] media The media of the stylesheet
      # @author Jack Polgar
      # @since 0.1
      #
      def css_link_tag(url, media = "screen")
        "<link rel=\"stylesheet\" href=\"#{url}?#{Time.now.to_i}\" media=\"#{media}\" />"
      end
      
      ##
      # Returns the code for linking javascript files.
      #
      # @example:
      #    js_inc_tag '/assets/js/app.js'
      #
      # @param [String] url The URL of the file
      # @author Jack Polgar
      # @since 0.1
      #
      def js_inc_tag(url)
        "<script src=\"#{url}\" type=\"text/javascript\"></script>"
      end

      ##
      # Builds HTML attributes
      #
      # @author Jack Polgar
      # @since 0.5
      #
      # @param [Hash] attributes
      #
      # @return [String]
      #
      def self.attributes(attributes)
        html = []
        attributes.each do |k, v|
          next if v == nil
          html.push "#{k}=\"#{v}\""
        end
        if attributes.count > 0
          " #{html.join(' ')}"
        else
          ''
        end
      end
    end
  end
end