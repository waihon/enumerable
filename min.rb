# min → obj
# min { |a, b| block } → obj
#
# Returns the object in enum with the minimum value. 
# The first form assumes all objects implement Comparable; 
# the second uses the block to return a <=> b.

require 'pp'

a = %w(albatross dog horse)

pp a.min                                   #=> "albatross"
pp a.min { |a, b| a.length <=> b.length }  #=> "dog"