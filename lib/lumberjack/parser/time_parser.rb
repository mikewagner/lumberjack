module Lumberjack
  module Parser
    class TimeParser

      class << self

        def parse string
          now = Time.now
          if string =~ /^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s{1,2}(\d{1,2})\s(\d{2})\:(\d{2})\:(\d{2})/i
            Time.local( now.year, $1, $2, $3, $4, $5 )
          else
            nil
          end
        end

      end

    end
  end
end
