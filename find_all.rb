# find_all { |obj| block } → array
# find_all → an_enumerator
# 
# Returns an array containing all elements of enum for which the given block 
# returns a true value.
#
# If no block is given, an Enumerator is returned instead.
#
# find_all and select are two names for the same method.

require 'pp'

pp (1..10).find_all { |i| i % 3 == 0 }  #=> [3, 6, 9]
pp (1..10).select { |i| i.even? }       #=> [2, 4, 6, 8, 10]
