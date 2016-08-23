class Line
  attr_accessor :character, :text

  def initialize( l )
    @character = grab_character_name!( l )
    @text = l
  end

  def grab_character_name!( l )
    n = l.match(/\s*(\w+).*?\:/m).captures
    l.gsub!(/^.*?:\s*/m, "")
    return n  
  end 
end 
