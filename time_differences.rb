# def my_min(arr)
#   arr.each do |n|
#     smallest = true
#     arr.each do |n1|
#       smallest = false if n > n1
#     end
#     return n if smallest
#   end
# end

#O(n^2)

def my_min(arr)
  smallest = nil

  arr.each do |n|
    smallest = n if smallest.nil? || n < smallest
  end

  smallest
end

# O(n)

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5


def largest_contiguous_subsum(list)
  subs = []

  list.each_with_index  do |num, index|
    list.each_with_index do |num1, index1|
      next if index1 < index
      subs << list[index..index1]
    end
  end

  subs.max_by{ |sub_arr| sub_arr.reduce(:+) }.reduce(:+)
end

#n^3 + n! + n -> O(n!)
require 'byebug'
def largest_contiguous_subsum(list)
  largest_sum = 0
  current_sum = 0

  list.each do |num|
    if largest_sum == 0
        current_sum = num
        largest_sum = num
    elsif current_sum + num < num
      if num > current_sum
        current_sum = num
        largest_sum = num
      end
    elsif current_sum + num < 0
      current_sum = num
    elsif current_sum + num > largest_sum
      current_sum += num
      largest_sum = current_sum
    elsif num > largest_sum
      largest_sum = num
    else
      current_sum += num
    end
  end

  largest_sum
end



list = [5, 3, -7]
p   largest_contiguous_subsum(list) # => 8

   list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8

list = [-5, -1, -3]
   p largest_contiguous_subsum(list) # => -1 (from [-1])
