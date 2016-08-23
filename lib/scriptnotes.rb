#!/home/jayem163/.rbenv/shims/ruby
require 'rubygems'
require 'nokogiri'
require_relative 'scriptnotes/real_transcript.rb'
require_relative 'scriptnotes/generated_transcript.rb'

test_parse = RealTranscript.new(263,true)
test_parse.save
puts "exited"
