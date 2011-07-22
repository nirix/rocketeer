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
  module HTMLHelper
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
        html_options.push "#{k.to_s}=\"#{v.to_s}\""
      end
      
      "<a #{html_options.join(' ')}>#{text}</a>"
    end
    
    def link_to_unless_current(text, the_url, options = {})
      if request.path_info == the_url
        text
      else
        link_to text, the_url, options
      end
    end
    
    def css_inc_tag(url, media = "screen")
      "<link rel=\"stylesheet\" href=\"#{url}?#{Time.now.to_i}\" media=\"#{media}\" />"
    end
    
    def js_inc_tag(url)
      "<script src=\"#{url}\" type=\"text/javascript\"></script>"
    end
  end

  helpers HTMLHelper
end