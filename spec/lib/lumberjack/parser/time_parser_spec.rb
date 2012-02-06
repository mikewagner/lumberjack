require 'spec_helper'
require 'lumberjack/parser/time_parser'

describe Lumberjack::Parser::TimeParser do

  context ".parse" do

    it "should parse string to time" do
      time = Time.now
      timestamp = time.strftime("%b %e %H:%M:%S")
      Lumberjack::Parser::TimeParser.parse(timestamp).asctime.should == time.asctime
    end

    it "should return nil for invalid string format" do
      Lumberjack::Parser::TimeParser.parse('March 8 12:59:00').should be_nil
    end

  end

end
