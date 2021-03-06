require 'lumberjack/parser/syslog3164'
require 'socket'

module Lumberjack
  class Skidder
    class Connection < EventMachine::Connection

      def initialize(skidder)
        @skidder = skidder
        super()      
      end

      def post_init
        super()
        @parser = Lumberjack::Parser::Syslog3164.new
      end

      def receive_data(data)
        peer = get_peername()
        adress, port = nil, nil
        if peer.is_a?(Array)
          address, port = peer
        else
          port, address = Socket.unpack_sockaddr_in(peer)
        end
        receive_line(address, port, data.chomp)
      end

      def receive_line(address, port, line)
        entry = Lumberjack::Entry.new
        entry.address = address
        entry.port    = port

        # parse the line and update entry
        @parser.parse(line, entry)
        # save entry
        @skidder.queue(entry)
      end

    end
  end
end
