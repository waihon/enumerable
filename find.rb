# find(ifnone = nil) { |obj| block } → obj or nil
# find(ifnone = nil) → an_enumerator
# 
# Passes each entry in enum to block. Returns the first for which block 
# is not false. 
# If no object matches, calls ifnone and returns its result when it is specified, 
# or returns nil otherwise.
#
# If no block is given, an enumerator is returned instead.
# 
# find and detect are two names for the same method.
