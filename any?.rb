# any? [{ |obj| block }] → true or false
# 
# Passes each element of the collection to the given block. 
# The method returns true if the block ever returns a value other than false or nil. 
# If the block is not given, Ruby adds an implicit block of { |obj| obj } that will 
# cause any? to return true if at least one of the collection members is not false or nil.

words = %w[ant bear cat]
p words.all? { |word| word.length >= 3 } #=> true
p words.all? { |word| word.length >= 4 } #=> true
p [nil, true, 99].all?                   #=> true