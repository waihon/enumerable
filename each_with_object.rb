# each_with_object(obj) { |(*args), memo_obj| ... } → obj
# each_with_object(obj) → an_enumerator
# 
# Iterates the given block for each element with an arbitrary object given, 
# and returns the initially given object.
#
# If no block is given, returns an enumerator.

require 'pp'

evens = (1..10).each_with_object([]) { |i, a| pp a; a << i * 2 }
#=> []
#   [2]
#   [2, 4]
#   [2, 4, 6]
#   [2, 4, 6, 8]
#   [2, 4, 6, 8, 10]
#   [2, 4, 6, 8, 10, 12]
#   [2, 4, 6, 8, 10, 12, 14]
#   [2, 4, 6, 8, 10, 12, 14, 16]
#   [2, 4, 6, 8, 10, 12, 14, 16, 18]
pp evens  #=> [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]