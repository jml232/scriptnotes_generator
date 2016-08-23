require 'open-uri'

class RealTranscript
  attr_accessor :episode, :text
  @@website_string = "http://johnaugust.com/2016/scriptnotes-ep-"

  def initialize(ep, refresh = false)
    @episode = ep
    unless( refresh || File.file?("./data/real_transcripts/#{@episode}.txt") )
      puts "File exists and not asked to refresh, loading existing RealTranscript"
      return load_transcript 
    else
      puts "Pulling transcript, name: #{@episode}.txt"
      grab_html
      strip_html
      format
      return
    end
  end

  def load
    file = File.open("data/real_transcripts/#{@episode}.txt","rb")
    @text = file.read
    file.close
  end

  def grab_html
    @text = Nokogiri::HTML(open(@@website_string + @episode.to_s))
  end

  def strip_html
    #grab just the content section
    @text = @text.at_css("section").to_s
    
    #strip away irrelevant content at top of article
    @text.gsub!(/<section.+?<\/p>/m,"")
    
    #turn both single and double smart quotes into into single regular quote
    @text.gsub!(/\&acirc\;\&\#128\;\&\#15[3,5-7]\;/,"\'")
    
    #turn hyphen into dash
    @text.gsub!(/\&acirc\;\&\#128\;\&\#147\;/,"-")
    
    #strip away irrelevant content at the bottom of article
    @text.gsub!(/<p>Links:.?<\/p>.*/m,"")
  end

  def format
    @text.gsub!(/<\/p>\s*<p>(\w)/m) {"\n#{$1}"}
    @text.gsub!(/<p><strong>/,"")
    @text.gsub!(/<\/strong>/,"")
  end

  def save  
    File.open("data/real_transcripts/#{@episode}.txt","w") {|f| f.write(@text)}
  end  
end
