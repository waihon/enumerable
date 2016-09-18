# sort → array click to toggle source
# sort { |a, b| block } → array
#
# Returns an array containing the items in enum sorted, 
# either according to their own <=> method, 
# or by using the results of the supplied block. 
# The block should return -1, 0, or +1 depending on the 
# comparison between a and b. 

require 'pp'

pp %w(rhea kea flea).sort  #=> ["flea", "kea", "rhea"]

pp (1..10).sort { |a, b| b <=> a}  #=> [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

