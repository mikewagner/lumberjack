module Lumberjack
  class Entry

    attr_accessor :address
    attr_accessor :hostname
    attr_accessor :port
    attr_accessor :pri
    attr_accessor :timestamp
    attr_accessor :message

    def save

    end

    def to_hash
      { :address   => address,
        :hostname  => hostname,
        :port      => port,
        :pri       => pri,
        :timestamp => timestamp,
        :message   => message }
    end

    def to_string
      "<#{pri}> #{timestamp} #{hostname} #{message}"
    end


  end
end
