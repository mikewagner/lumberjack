require 'lumberjack/skidder/connection'

module Lumberjack
  class Skidder

    attr_accessor :transport, :port, :ip

    def initialize
    end


    def start
      puts "Listening on #{ip}:#{port} over #{transport}"
      EventMachine::open_datagram_socket( @ip, @port, Lumberjack::Skidder::Connection )
    end

  end
end
