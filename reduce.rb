# reduce(initial, sym) → obj
# reduce(sym) → obj
# reduce(initial) { |memo, obj| block } → obj
# reduce { |memo, obj| block } → obj
# 
# Combines all elements of enum by applying a binary operation, 
# specified by a block or a symbol that names a method or operator.

# If you specify a block, then for each element in enum the block 
# is passed an accumulator value (memo) and the element. 
# If you specify a symbol instead, then each element in the collection 
# will be passed to the named method of memo. In either case, the result 
# becomes the new value for memo. At the end of the iteration, the final 
# value of memo is the return value for the method.
#
# If you do not explicitly specify an initial value for memo, 
# then the first element of collection is used as the initial value of memo.
#
# reduce and inject are two names for the same method