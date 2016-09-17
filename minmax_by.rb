# minmax_by { |obj| block } → [min, max]
# minmax_by → an_enumerator
# 
# Returns a two element array containing the objects in enum that correspond to 
# the minimum and maximum values respectively from the given block.
# 
# If no block is given, an enumerator is returned instead.

require 'pp'

a = %w(albatross dog horse)

pp a.minmax_by { |x| x }          #=> ["albatross", "horse"]
pp a.minmax_by { |x| x.length  }  #=> ["dog", "albatross"]