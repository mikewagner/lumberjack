module Lumberjack
  module Parser
    class Syslog3164

      def initialize
        @parser = nil
        init
      end

      def init
        pri    = "(?:<(?<pri>[0-9]{1,3})>)?"
        month  = "(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)"
        day    = "(?: [1-9]|[12][0-9]|3[01])"
        hour   = "(?:[01][0-9]|2[0-4])"
        minute = "(?:[0-5][0-9])"
        second = "(?:[0-5][0-9])"
       
        time   = [hour, minute, second].join(":")
        
        timestamp = "(?<timestamp>#{month} #{day} #{time})"
        hostname  = "(?<hostname>[A-Za-z0-9_.:]+)"
        header    = timestamp + " " + hostname
        message   = "(?<message>[ -~]+)"  # ascii 32 to 126

        re = "^#{pri}#{header} #{message}$"

        @parser = Regexp.new(re)
      end


      def parse(line, entry)
        m = @parser.match(line)
        if m
          entry.pri = m[1] || '13'
          entry.timestamp = m[2]
          entry.hostname  = m[3]
          entry.message   = m[4]
          true
        else
          false
        end
      end

    end
  end
end
