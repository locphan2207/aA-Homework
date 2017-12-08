class Queue
  attr_reader :array
  def initialize
    @array = []
  end

  def enqueue(el)
    @array << el 
  end

  def dequeue
    @array.shift
  end

  def show
    @array
  end
end