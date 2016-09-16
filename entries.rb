# entries → array click to toggle source
#
# Returns an array containing the items in enum.
#
# Personal note: It returns the same result as that of to_a.

require 'pp'

ary1 = (1..7).entries                      
pp ary1 #=> [1, 2, 3, 4, 5, 6, 7]
ary2 = { "a"=>1, "b"=>2, "c"=>3 }.entries
pp ary2 #=> [["a", 1], ["b", 2], ["c", 3]]