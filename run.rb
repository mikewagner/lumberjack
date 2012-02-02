#!/usr/bin/env ruby
$:.unshift( File.join( File.dirname(__FILE__), "/lib" ) )

require 'eventmachine'
require 'lumberjack'

servers = [
  Lumberjack::Server.new( :ip => '0.0.0.0', :port => 3001, :transport => :udp )
]

EventMachine::run do
  servers.each do |server|
    p server
  end
end

  


