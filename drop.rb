# drop(n) → array
#
# Drops first n elements from enum, and returns rest elements in an array.

require 'pp'

a = [1, 2, 3, 4, 5, 6]
pp a.drop(3)  #=> [4, 5, 6]