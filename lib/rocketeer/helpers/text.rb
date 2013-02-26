#
# Rocketeer
# Copyright (C) 2011-2012 Jack Polgar
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
    module Text
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
