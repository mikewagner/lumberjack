require 'lumberjack/server/connection'

module Lumberjack
  class Skidder

    attr_accessor :transport, :port, :ip

    def initialize
    end


    def start
      EventMachine::open_datagram_socket( @ip, @port, Lumberjack::Server::Connection )
    end

  end
end
