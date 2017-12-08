class Queue
  attr_reader :array
  def initialize
    # create ivar to store stack here!
    @array = []
  end

  def enqueue(el)
    # adds an element to the stack
    @array << el 
  end

  def dequeue
    # removes one element from the stack
    @array.shift
  end

  def show
    # return a copy of the stack
    @array
  end
end