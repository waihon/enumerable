# one? [{ |obj| block }] → true or false
# 
# Passes each element of the collection to the given block. 
# The method returns true if the block returns true exactly once. 
# If the block is not given, one? will return true only if exactly one of 
# the collection members is true.

require 'pp'

pp %w(ant bear cat).one? { |word| word.length == 4 }  #=> true
pp %w(ant bear cat).one? { |word| word.length > 4 }   #=> false
pp %w(ant bear cat).one? { |word| word.length < 4 }   #=> false

pp [nil, true, 99].one?                               #=> false
pp [nil, true, false].one?                            #=> true
