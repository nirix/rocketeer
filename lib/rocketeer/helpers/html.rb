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
  module HTMLHelper
    ##
    # Creates a link to the specified URL with the specified text
    #
    # Useage:
    #
    #    link_to 'Google', 'http://google.com.au'
    #
    # @param [String] text The text for the link
    # @param [String] the_url The URL to link to
    # @param [Hash] options Options for the link
    # @author Jack Polgar
    # @since 0.1
    #
    def link_to(text, the_url, options = {})
      options = options.merge({
        :href => the_url ? url(the_url) : request.path_info
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
    # Useage:
    #
    #    link_to_unless_current 'Google', 'http://google.com.au'
    #
    # @param [String] text The text for the link
    # @param [String] the_url The URL to link to
    # @param [Hash] options Options for the link
    # @author Jack Polgar
    # @since 0.1
    #
    def link_to_unless_current(text, the_url, options = {})
      if request.path_info == the_url
        text
      else
        link_to text, the_url, options
      end
    end
    
    ##
    # Creates a link to the specified URL if the condition is met.
    #
    # Useage:
    #
    #    link_to_if Time.now.year == 2011, 'Google', 'http://google.com.au'
    #
    # @param [Boolean] condition The condition to check
    # @param [String] text The text for the link
    # @param [String] the_url The URL to link to
    # @param [Hash] options Options for the link
    # @author Jack Polgar
    # @since 0.3
    #
    def link_to_if(condition, text, the_url, options = {})
      if condition
        link_to text, the_url, options = {}
      else
        text
      end
    end
    
    ##
    # Returns the code for linking CSS style sheets.
    #
    # Useage:
    #
    #    css_inc_tag '/assets/css/master.css'
    #    css_inc_tag '/assets/css/print.css', 'screen'
    #
    # @param [String] url The URL of the stylesheet
    # @param [String] media The media of the stylesheet
    # @author Jack Polgar
    # @since 0.1
    #
    def css_inc_tag(url, media = "screen")
      "<link rel=\"stylesheet\" href=\"#{url}?#{Time.now.to_i}\" media=\"#{media}\" />"
    end
    
    ##
    # Returns the code for linking javascript files.
    #
    # Useage:
    #
    #    js_inc_tag '/assets/js/app.js'
    #
    # @param [String] url The URL of the file
    # @author Jack Polgar
    # @since 0.1
    #
    def js_inc_tag(url)
      "<script src=\"#{url}\" type=\"text/javascript\"></script>"
    end
  end

  helpers HTMLHelper
end