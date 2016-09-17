# max_by { |obj| block } → obj
# max_by → an_enumerator
#
# Returns the object in enum that gives the maximum value from the given block.
#
# If no block is given, an enumerator is returned instead.

require 'pp'

a = %w(albatross dog horse)

pp a.max_by { |x| x }           #=> "horse"
pp a.max_by { |x| x.length }    #=> "albatross"