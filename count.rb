# count → int
# count(item) → int
# count { |obj| block } → int
#
# Returns the number of items in enum through enumeration. 
#
# If an argument is given, the number of items in enum that are equal to item 
# are counted. 
# 
# If a block is given, it counts the number of elements yielding a true value.

require 'pp'

ary = [1, 2, 4, 2]

pp ary.count                     #=> 4
pp ary.count(2)                  #=> 2
pp ary.count { |x| x % 2 == 0 }  #=> 3