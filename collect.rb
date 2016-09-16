# collect { |obj| block } → array
# collect → an_enumerator
#
# Returns a new array with the results of running block once for every element in enum.
# If no block is given, an enumerator is returned instead.

require 'pp'

pp (1..4).collect { |i| i * i }  #=> [1, 4, 9, 16]
pp (1..4).collect { "cat" }      #=> ["cat", "cat", "cat", "cat" ]
(1..4).collect.each { |i| pp i }