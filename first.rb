# first → obj or nil click to toggle source
# first(n) → an_array
#
# Returns the first element, or the first n elements, of the enumerable. 
# If the enumerable is empty, the first form returns nil, and the second form 
# returns an empty array.

require 'pp'

pp %w[foo bar baz].first      #=> "foo"
pp %w[foo bar baz].first(2)   #=> ["foo", "bar"]
pp %w[foo bar baz].first(10)  #=> ["foo", "bar", "baz"]

pp [].first                   #=> nil
pp [].first(2)                #=> []