# each_cons(n) { ... } → nil
# each_cons(n) → an_enumerator
#
# Iterates the given block for each array of consecutive <n> elements. 
# If no block is given, returns an enumerator.

require 'pp'

(1..10).each_cons(3) { |a| pp a }
#=> [1, 2, 3]
#   [2, 3, 4]
#   [3, 4, 5]
#   [4, 5, 6]
#   [5, 6, 7]
#   [6, 7, 8]
#   [7, 8, 9]
#   [8, 9, 10]
