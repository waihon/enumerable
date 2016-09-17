# partition { |obj| block } → [ true_array, false_array ]
# partition → an_enumerator
# 
# Returns two arrays, the first containing the elements of enum for which 
# the block evaluates to true, the second containing the rest.
#
# If no block is given, an enumerator is returned instead.

require 'pp'

pp (1..6).partition { |v| v.even? } #=> [[2, 4, 6], [1, 3, 5]]