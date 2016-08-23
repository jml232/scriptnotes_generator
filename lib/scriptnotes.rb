#!/home/jayem163/.rbenv/shims/ruby
require 'rubygems'
require 'nokogiri'
require_relative 'scriptnotes/real_transcript.rb'
require_relative 'scriptnotes/generated_transcript.rb'
require_relative 'scriptnotes/line.rb'
require_relative 'scriptnotes/word_instance_map.rb'
require_relative 'scriptnotes/word_map.rb'

test_map = WordInstanceMap.new("John", [263])
