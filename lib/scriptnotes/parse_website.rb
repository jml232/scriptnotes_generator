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
    # art2 = article.to_s.sub((/<article>.*here<\/a>\.<\/p>\W+/m),'')
    article = article.to_s.gsub(/\&acirc\;\&\#128\;\&\#153\;/,"\'")
    article = article.gsub(/\&acirc\;\&\#128\;\&\#15[6,7]\;/,"\"")
    File.open("testout.txt","w") {|f| f.write(article.to_s)}
    puts "################\n\n\n\n"
  end  
end
