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
  module TextHelper
    def pluralize(count, singular, plural = nil)
      "#{count || 0} " + ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
    end
    
    def short_text(text, length = 30, truncate_string = "...")
      return if text.nil?
      l = length - truncate_string.mb_chars.length
      text.mb_chars.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
    end
  end
  
  helpers TextHelper
end