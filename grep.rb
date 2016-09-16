# grep(pattern) → array
# grep(pattern) { |obj| block } → array
#
# Returns an array of every element in enum for which Pattern === element. 
# If the optional block is supplied, each matching element is passed to it, 
# and the block’s result is stored in the output array.

require 'pp'

pp (1..100).grep 38..44   #=> [38, 39, 40, 41, 42, 43, 44]

c = IO.constants
pp c.grep(/SEEK/)         #=> [:SEEK_SET, :SEEK_CUR, :SEEK_END]

seek = c.grep(/SEEK/) { |v| IO.const_get(v) }
pp seek                   #=> [0, 1, 2]

pp c.grep(/LOCK_/)        #=> [:LOCK_SH, :LOCK_EX, :LOCK_UN, :LOCK_NB]

lock = c.grep(/LOCK_/) { |v| IO.const_get(v) }
pp lock                   #=> [1, 2, 8, 4]


