# include?(obj) → true or false
# 
# Returns true if any member of enum equals obj. Equality is tested using ==.

require 'pp'

pp IO.constants.include? :SEEK_SET         #=> true
pp IO.constants.include? :SEEK_NO_FURTHER  #=> false