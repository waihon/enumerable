# take_while { |arr| block } → array
# take_while → an_enumerator
# 
# Passes elements to the block until the block returns nil or false, 
# then stops iterating and returns an array of all prior elements.
# 
# If no block is given, an enumerator is returned instead.

require 'pp'

a = [1, 2, 3, 4, 5, 6]
pp a.take_while { |i| i <= 3 }  #=> [1, 2, 3]