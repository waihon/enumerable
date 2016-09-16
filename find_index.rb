# find_index(value) → int or nil
# find_index { |obj| block } → int or nil
# find_index → an_enumerator
# 
# Compares each entry in enum with value or passes to block. 
# Returns the index for the first for which the evaluated value is non-false. 
# If no object matches, returns nil
# 
# If neither block nor argument is given, an enumerator is returned instead.

require 'pp'

pp (1..10).find_index { |i| i % 5 == 0 and i % 7 == 0 }        #=> nil
pp (1..100).find_index { |i| i % 5 == 0 and i % 7 == 0 }       #=> 34
pp (1..100).find_index(50)                                     #=> 49
pp %w(google facebook twitter linkedin).find_index("twitter")  #=> 2



