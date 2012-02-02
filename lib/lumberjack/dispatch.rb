require 'lumberjack/skidder'

module Lumberjack
  module Dispatch

    def init
      @servers = []
    end

    def servers
      @servers
    end

    def listen(&block)
      server = Lumberjack::Skidder.new

      yield(server)

      @servers << server
    end

    def start
      EventMachine.run do
        @servers.each do |server|
          server.start
        end
      end
    end


  end
end
