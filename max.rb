# max → obj
# max { |a, b| block } → obj
#
# Returns the object in enum with the maximum value. 
# The first form assumes all objects implement Comparable; 
# the second uses the block to return a <=> b.

require 'pp'

a = %w(albatross dog horse)

pp a.max                                  # "horse"
pp a.max { |a, b| a.length <=> b.length } # "albatross"