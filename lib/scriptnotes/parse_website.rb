require 'open-uri'

class ParseWebsite
  attr_accessor :episode

  def initialize(ep, create_new=false)
    @episode = ep
    unless( create_new || File.file?("./data/#{@episode}.txt") )
      puts "file exists and not asked to create_new"
      return
    else
      puts "generating new file, name: #{@episode}.txt"
      grab_html
    end
  end

  def grab_html
    puts "at grab_html def, attempting to grab "
    doc = Nokogiri::HTML(open("http://johnaugust.com/2016/scriptnotes-ep-#{@episode}"))
    puts "got webpage"
    article = doc.at_css("section")
    article = article.to_s.gsub(/<section.?<\/p>/m,"")
    article = article.gsub(/\&acirc\;\&\#128\;\&\#15[3,5-7]\;/,"\'")
    article = article.gsub(/\&acirc\;\&\#128\;\&\#147\;/,"-")
    article = article.gsub(/<p>Links:.?<\/p>.*/m,"")
    File.open("testout.txt","w") {|f| f.write(article.to_s)}
    
  end  
end
