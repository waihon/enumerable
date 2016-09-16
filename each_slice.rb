# each_slice(n) { ... } → nil
# each_slice(n) → an_enumerator
# 
# Iterates the given block for each slice of <n> elements. 
# If no block is given, returns an enumerator.

require 'pp'

(1..10).each_slice(3) { |a| pp a }
#=> [1, 2, 3]
#   [4, 5, 6]
#   [7, 8, 9]
#   [10]