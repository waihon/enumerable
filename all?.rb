# all? [{ |obj| block } ] → true or false 
#
# Passes each element of the collection to the given block. 
# The method returns true if the block never returns false or nil. 
# If the block is not given, Ruby adds an implicit block of { |obj| obj } 
# which will cause all? to return true when none of the collection members 
# are false or nil.

words = %w[ant bear cat]
p words.all? { |word| word.length >= 3 } #=> true
p words.all? { |word| word.length >= 4 } #=> false
p [nil, true, 99].all?                   #=> false