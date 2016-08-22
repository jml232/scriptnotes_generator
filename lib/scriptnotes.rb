#!/usr/bin/ruby

def create_transcript_file(name="Scriptnotes_#{Time.now.to_i}.txt")

  ts = Transcript.new

  text = ts.text

  out_file = File.new(name,"w")
  out_file.puts(text)
  out_file.close

end

class Transcript
  @text = "testing text 1"

  class << self
    attr_accessor :text
  end

  attr_accessor :text
  def initialize
    @text = "testing text 2"
  end
end

create_transcript_file()

print "scriptnotes has completed \n"
