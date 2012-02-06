require 'lumberjack/skidder/connection'
require 'em-mongo'

module Lumberjack
  class Skidder

    attr_accessor :transport, :port, :ip

    def initialize
      @redis = Redis.new( :host => 'localhost', :port => 6379 )
      @queue = 'queue:logs'
    end

    def queue entry
      @redis.rpush( @queue, entry.to_hash )
    end


    def start
      puts "Listening on #{ip}:#{port} over #{transport}"
      EventMachine::open_datagram_socket( @ip, @port, Lumberjack::Skidder::Connection, self )
    end

  end
end
