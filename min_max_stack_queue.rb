require_relative 'stack.rb'

class StackQueue

  attr_reader :min, :max
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def max
    return @in_stack.max if @out_stack.empty?
    return @out_stack.max if @in_stack.empty?
    @in_stack.max > @out_stack.max ? @in_stack.max : @out_stack.max
  end

  def min
    return @in_stack.min if @out_stack.empty?
    return @out_stack.min if @in_stack.empty?
    @in_stack.min < @out_stack.min ? @in_stack.min : @out_stack.min
  end

  def dequeue
    if @out_stack.empty?
      @out_stack.push(@in_stack.pop[:value]) until @in_stack.empty?
    end
    @out_stack.pop
  end

  def peek
    @out_stack.last
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end
end
