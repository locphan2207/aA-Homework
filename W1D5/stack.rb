class Stack
  attr_reader :array
  def initialize
    # create ivar to store stack here!
    @array = []
  end

  def add(el)
      # add an element to the stack
    @array << el 
  end

  def remove
    # removes one element from the stack
    @array.pop
  end

  def show
    # return a copy of the stack
    @array
  end
end