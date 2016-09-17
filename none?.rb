# none? [{ |obj| block }] → true or false
# 
# Passes each element of the collection to the given block. 
# The method returns true if the block never returns true for all elements. 
# If the block is not given, none? will return true only if none of the 
# collection members is true.

require 'pp'

pp %w(ant bear cat).none? { |word| word.length == 5 } # true
pp %w(ant bear cat).none? { |word| word.length >= 4 } # false
pp [].none?                                           # true
pp [nil].none?                                        # true
pp [nil, false].none?                                 # true
pp [nil, false, 0].none?                              # false