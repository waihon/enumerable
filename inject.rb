# inject(initial, sym) → obj
# inject(sym) → obj
# inject(initial) { |memo, obj| block } → obj
# inject { |memo, obj| block } → obj
#
# Combines all elements of enum by applying a binary operation, 
# specified by a block or a symbol that names a method or operator.
#
# If you specify a block, then for each element in enum the block is passed 
# an accumulator value (memo) and the element. If you specify a symbol instead, 
# then each element in the collection will be passed to the named method of memo. 
# In either case, the result becomes the new value for memo. At the end of the 
# iteration, the final value of memo is the return value for the method.
#
# If you do not explicitly specify an initial value for memo, then the first element
# of collection is used as the initial value of memo.
#
# inject and reduce are two names for the same method.

require 'pp'

# Sum some numbers
pp (5..10).inject(:+) #=> 45

# Same using a block and reduce
(5..10).reduce { |sum, n| pp [sum, n]; sum + n }  #=> 45
#=> [5, 6]
#   [11, 7]
#   [18, 8]
#   [26, 9]
#   [35, 10]

(5..10).reduce(0) { |sum, n| pp [sum, n]; sum + n } #=> 45
#=> [0, 5]
#   [5, 6]
#   [11, 7]
#   [18, 8]
#   [26, 9]
#   [35, 10]

# Multiply some numbers
pp (5..10).inject(1, :*)  #=> 151200

# same using a block and reduce
pp (5..10).reduce(1) { |product, n| pp [product, n]; product * n} #=> 151200
#=> [1, 5]
#   [5, 6]
#   [30, 7]
#   [210, 8]
#   [1680, 9]
#   [15120, 10]

# Find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
  pp [memo, word]
  memo.length > word.length ? memo : word
end
#=> ["cat", "sheep"]
#   ["sheep", "bear"]
pp longest  #=> "sheep"
