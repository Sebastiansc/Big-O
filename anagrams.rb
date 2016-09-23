require 'byebug'

def first_anagram?(str1, str2)
  anagrams = str1.chars.permutation(str1.length)
  anagrams.to_a.any? { |anagram| anagram.join == str2 }
end

#O(n!)

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true


def second_anagram?(str1, str2)
  str1.each_char do |letter1|
    str2.each_char do |letter2|
      if letter1 == letter2
        str1.delete!(letter1)
        str2.delete!(letter2)
      end
    end
  end

  str1 + str2 == ""
end

#O(n^2)


p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

#O(nlogn)

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
  words = {}

  str1.chars.each do |letter|
    words[letter] ||= 0
    words[letter] += 1
  end

  str2.chars.each do |letter|
    words[letter] ||= 0
    words[letter] += 1
  end

  words.values.none?{ |count| count.odd? }
end

#O(n)

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
