module Lumberjack
  module CLI
    class Execute

      def initialize params
        @params = params
        start
      end

      def start
        Lumberjack.init
        config = load_config( @params[:config] )
        Lumberjack.start
      end


      def load_config( config )
        abort "Unable to find config file" unless File.exist?( config )
        load File.expand_path( config )
      rescue Exception => e
        puts "There was an error in #{config}"
        puts "\t" + e.message
        puts "\t" + e.backtrace.join("\n\y\t")
      end

    end
  end
end
