# minmax → [min, max]
# minmax { |a, b| block } → [min, max]
# 
# Returns two elements array which contains the minimum and the maximum value 
# in the enumerable. 
# The first form assumes all objects implement Comparable; 
# the second uses the block to return a <=> b.

require 'pp'

a = %w(albatross dog horse)

pp a.minmax                                   #=> ["albatross", "horse"]
pp a.minmax { |a, b| a.length <=> b.length }  #=> ["dog", "albatross"]