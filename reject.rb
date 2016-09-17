# reject { |obj| block } → array
# reject → an_enumerator
#
# Returns an array for all elements of enum for which the given block returns false.
#
# If no block is given, an Enumerator is returned instead.

require 'pp'

pp (1..10).reject { |i| i % 3 == 0} # [1, 2, 4, 5, 7, 8, 10]

pp [1, 2, 3, 4, 5].reject { |num| num.even? } #=> [1, 3, 5]