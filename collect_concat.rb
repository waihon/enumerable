# collect_concat { |obj| block } → array
# collect_concat → an_enumerator
# 
# Returns a new array with the concatenated results of running block once 
# for every element in enum.
#
# If no block is given, an enumerator is returned instead.
#
# collect_concat and flat_map are two names for the same method.


require 'pp'

pp [1, 2, 3, 4].collect_concat { |e| [e, -e] }  #=> [1, -1, 2, -2, 3, -3, 4, -4]
pp [[1, 2], [3, 4]].collect_concat { |e| e + [100] }  #=> [1, 2, 100, 3, 4, 100]

