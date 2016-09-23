class MyStack
  attr_reader :max
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    if !@store.empty?
      last_max = peek[:max]
      last_min = peek[:min]
      max = el > last_max ? el : last_max
      min = el < last_min ? el : last_min
    else
      min = el
      max = el
    end

    @store << { value: el, min: min, max: max }
  end

  def max
    peek[:max]
  end

  def min
    peek[:min]
  end

  def size
    @store.length
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end
end
