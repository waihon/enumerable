# cycle(n=nil) { |obj| block } → nil
# cycle(n=nil) → an_enumerator
# 
# Calls block for each element of enum repeatedly n times or 
# forever if none or nil is given. 
# If a non-positive number is given or the collection is empty, does nothing. 
# Returns nil if the loop has finished without getting interrupted.
# cycle saves elements in an internal array so changes to enum after the first pass 
# have no effect.
# If no block is given, an enumerator is returned instead.

require 'pp'

a = ["a", "b", "c"]
#a.cycle { |x| pp x }     # print a, b, c, ab, b, c, ... forever.
a.cycle(2) { |x| pp x }   # print a, b, c, a, b, c.
a.cycle(-2) { |x| pp x }  # print nothing

