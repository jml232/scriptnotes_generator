# coding: utf-8

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  
  spec.name		= "scriptnotes"
  spec.version		= "1.0"
  spec.authors		= ["John Michael Larmour"]
  spec.email		= ["BourbonMyth@gmail.com"]
  spec.summary		= %q{A command line application that creates scriptnotes transcripts}
  spec.license		= "MIT"
  
  spec.files		= ['lib/scriptnotes.rb']
  spec.executables	= ['bin/scriptnotes']
  spec.test_files 	= ['tests/test_scriptnotes.rb']
  spec.require_paths	= ["lib"]

end
