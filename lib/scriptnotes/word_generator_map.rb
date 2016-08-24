class WordGeneratorMap
  attr_accessor :maps, :character

  def initialize(wim)
    @maps = {}
    @maps = convert_wim( wim )
    @character = wim.character
  end

  def convert_wim ( wim )
    wim.maps.each do |wm|
      puts "\n\nwm is #{wm.inspect}\n\n"
      @maps << convert_generator_wm( wm )
    end
  end
    
  def convert_generator_wm( wm )
    chance_slot = 1
    sum = 0
    gen_a = []
    gen_a[0] = wm.total
    wm.map.each do |k, v|
      gen_a[chance_slot] = (v + sum)
      gen_a[chance_slot+1] = k.to_s
      sum += v
      chance_slot += 2
    end
    return gen_a
  end

  def gen_next_word( w )
    wm = @maps[w]
    iter = 1
    target = Random.rand(wm[0]+1)
    while target > wm[iter]
      iter += 2
    end
    return wm[iter+1]
  end
end
    
  
