class Map
  attr_reader :arr_2d
  def initialize
    @arr_2d = []
  end
  
  def has_key?(key)
    @arr_2d.each {|pair| return true if pair[0] == key}
    false
  end
  
  def assign(key, value)
    if has_key?(key)
      @arr_2d.each {|pair| pair[1] = value if pair[0] == key}
    else
      @arr_2d << [key, value]
    end
  end
  
  def lookup(key)
    @arr_2d.each {|pair| return pair[1] if pair[0] == key}
    nil
  end
  
  def remove(key)
    @arr_2d.each_with_index {|pair, idx| @arr_2d.delete_at(idx) if pair[0] == key}
  end
end