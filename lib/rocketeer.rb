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

require 'sinatra/base'

require 'rocketeer/helpers/html'
require 'rocketeer/helpers/form'
require 'rocketeer/helpers/text'

# @private
module Sinatra
  helpers Rocketeer::Helpers::HTML
  helpers Rocketeer::Helpers::Form
  helpers Rocketeer::Helpers::Text
end