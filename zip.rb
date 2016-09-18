# zip(arg, ...) → an_array_of_array
# zip(arg, ...) { |arr| block } → nil
# 
# Takes one element from enum and merges corresponding elements from each args. 
# This generates a sequence of n-element arrays, where n is one more than the 
# count of arguments. The length of the resulting sequence will be enum#size. 
# If the size of any argument is less than enum#size, nil values are supplied. 
# 
# If a block is given, it is invoked for each output array, otherwise 
# an array of arrays is returned.

require 'pp'

a = [4, 5, 6]
b = [7, 8, 9]

pp [1, 2, 3].zip(a, b)  #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
pp [1, 2].zip(a, b)     #=> [[1, 4, 7], [2, 5, 8]]
pp a.zip([1, 2], [8])   #=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]]