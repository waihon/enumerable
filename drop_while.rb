# drop_while { |arr| block } → array
# drop_while → an_enumerator
# 
# Drops elements up to, but not including, the first element for which the block 
#returns nil or false and returns an array containing the remaining elements.

require 'pp'

a = [1, 2, 3, 4, 5, 6]
pp a.drop_while { |i| i < 3 } #=> [3, 4, 5, 6]

