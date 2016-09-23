def bad_two_sum?(arr, value)
  arr.each.with_index do |el, index|
    arr.each_with_index do |el1, index1|
      next if index1 <= index
      return true if el + el1 == value
    end
  end

  false
end

#O(n^2)


arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

require 'byebug'
def okay_two_sum?(arr, target)
  arr = arr.sort!

  arr.each.with_index do |num, index|
    needed = target - num
    return true if bsearch(arr[index+1..-1], needed)
  end

  false
end

def bsearch(arr, target)
  midpoint = arr.length / 2

  return true if arr[midpoint] == target
  return false if arr.length <= 1

  if target > arr[midpoint]
    bsearch(arr[midpoint+1..-1], target)
  else
    bsearch(arr[0...midpoint], target)
  end
end

#sort -> nlogn
#search -> n
#O(nlogn)
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 8) # => should be false


def hardcore_two_sum?(arr, target)
  nums = {}
  arr.each{ |n| nums[n] = n }

  nums.each do |n,_|
    needed = target - n
    return true if !nums[needed].nil? && nums[needed] != n
  end

  false
end

#2n -> O(n)

puts "Last"
p hardcore_two_sum?(arr, 10) # => should be false
p hardcore_two_sum?(arr, 6) # => should be true
