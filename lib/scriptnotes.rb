#!/home/jayem163/.rbenv/shims/ruby
require 'rubygems'
require 'nokogiri'
require_relative 'scriptnotes/real_transcript.rb'
require_relative 'scriptnotes/generated_transcript.rb'
require_relative 'scriptnotes/line.rb'
require_relative 'scriptnotes/word_instance_map.rb'
require_relative 'scriptnotes/word_map.rb'
require_relative 'scriptnotes/word_generator_map.rb'

test_map = WordInstanceMap.new("John", [263])
gen = WordGeneratorMap.new( test_map )
puts "Hello"
i = 0
nw = gen.gen_next_word("Hello")
while i < 10
  i += 1
  nw = gen.gen_next_word(nw)
  puts nw+" "
end

