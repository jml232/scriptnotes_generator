
class WordMap
  attr_accessor :word, :total, :map
  
  def initialize(w)
    @total = 0
    @word = w
    @map = {}
  end

  def add( t )
    unless @map.key?(t)
      @map[t] = 0
    end
    @total += 1
    @map[ t ] += 1
  end
  
  def print
    str = "[#{@word}\|#{@total}]"
    map.each do |k, n|
      str << "[#{k}|#{n}]"
    end
    return str
  end
end
      
