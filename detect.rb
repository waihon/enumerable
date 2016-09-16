# detect(ifnone = nil) { |obj| block } → obj or nil
# detect(ifnone = nil) → an_enumerator
# 
# Passes each entry in enum to block. Returns the first for which block is not false. 
# If no object matches, calls ifnone and returns its result when it is specified, 
# or returns nil otherwise.
# If no block is given, an enumerator is returned instead.
# 
# detect and find are two names for the same method.

require 'pp'

def none_method
  "None Method"
end

proc = proc { "None Proc" }

lambda = lambda { "None Lamda" }

pp (1..10).detect { |i| i % 5 == 0 and i % 7 == 0 }  #=> nil
pp (1..10).detect(method(:none_method)) { |i| i % 5 == 0 and i % 7 == 0 }  #=> "None Method"
pp (1..10).detect(proc) { |i| i % 5 == 0 and i % 7 == 0 }  #=> "None Proc"
pp (1..10).detect(lambda) { |i| i % 5 == 0 and i % 7 == 0 }  #=> "None Lambda"

pp (1..100).find { |i| i % 5 == 0 and i % 7 == 0 } #=> 35