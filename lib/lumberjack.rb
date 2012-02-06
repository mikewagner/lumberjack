# encoding: UTF-8
# Make sure you have the correct versions of the gems (see gemspec) in your load path.
require 'eventmachine'
require 'logger'
require 'redis'

module Lumberjack

  autoload :Dispatch,   'lumberjack/dispatch'
  autoload :Server,     'lumberjack/skidder'
  autoload :Entry,      'lumberjack/entry'
  autoload :Connection, 'lumberjack/skidder/connection'

  # parsers
  autoload :Syslog3164, 'lumberjack/parser/syslog3164'
  autoload :TimeParser, 'lumberjack/parser/time_parser'
  
  extend Dispatch

end


