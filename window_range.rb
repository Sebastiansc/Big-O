require 'byebug'
require_relative 'min_max_stack_queue'

def max_windowed_range(array, window_size)
  current_max = nil

  array.each_cons(window_size) do |window|
    diff =  window.max - window.min
    if current_max.nil? || diff > current_max
      current_max = diff
    end
  end

  current_max
end

#2 * window_sizeN + n

def max_windowed_range(array, window_size)
  # byebug
  stack_queue = StackQueue.new
  window_size.times { stack_queue.enqueue(array.shift) }
  current_max = stack_queue.max - stack_queue.min

  array.each do |el|
    stack_queue.dequeue
    stack_queue.enqueue(el)
    diff = stack_queue.max - stack_queue.min

    current_max = diff if diff > current_max
  end

  current_max
end



#n + n -> O(n)


p max_windowed_range([1, 0, 2, 5, 4, 8], 2)# == 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3)# == 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4)# == 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5)# == 6 # 3, 2, 5, 4, 8
