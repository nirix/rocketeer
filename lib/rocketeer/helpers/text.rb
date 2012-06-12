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
    module Text
      ##
      # Pluralizes the string.
      #
      # @example:
      #    pluralize comments.count, 'comment'
      #
      # @param [Integer] count The count
      # @param [String] singular The singular form of the string
      # @param [String] plural The plural form of the word
      # @author Jack Polgar
      # @since 0.1
      #
      def pluralize(count, singular, plural = nil)
        "#{count || 0} " + ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
      end
      
      ##
      # Shortens the string to the specified length
      #
      # @example:
      #    shorten_string 'A very, very, long string', 5
      #
      # @param [String] text The string to shorten
      # @param [Integer] length The length to shorten to
      # @param [String] truncate_string Text to place at the end of the shortened string
      # @author Jack Polgar
      # @since 0.1
      #
      def shorten_string(text, length = 30, truncate_string = "...")
        return if text.nil?
        l = length - truncate_string.length
        text.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
      end
    end
  end
end