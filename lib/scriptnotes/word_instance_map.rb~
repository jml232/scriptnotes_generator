class WordInstanceMap
  attr_accessor :maps, :episodes, :character

  def initialize( char, eps )
    @character = char
    @episodes = eps
    @maps = {}
    create_maps
  end

  def create_maps
    @episodes.each do |ep|
      add_episode ep
    end
  end

  def add_episode( ep )
    lines = RealTranscript.new(ep).line_array
    lines.each do |l|
      if l.character[0] == @character
        add_line(l.text)
      end
    end
    puts "maps of is: #{@maps["is"].inspect}"
  end

  def add_line( l )
    wds = l.split(" ")
    c = 0
    while c < (wds.size() - 2)
      self.add(wds[c],wds[c+1])
      c += 1
    end
  end
  
  def add(w,t)
    unless @maps.key?(w)
      @maps[w] = WordMap.new(w)
    end
    @maps[w].add(t)
  end
  
  def print
    str = "[Character: #{@character}, Episodes: #{@episodes}]\n"
    @maps.each do |k, wm|
      str << wm.print
      str << "\n"
    end
  end    
end
