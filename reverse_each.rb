# reverse_each(*args) { |item| block } → enum
# reverse_each(*args) → an_enumerator
# 
# Builds a temporary array and traverses that array in reverse order.
# Given arguments are passed through to each().
# 
# If no block is given, an enumerator is returned instead.

require 'pp'

(1..3).reverse_each { |v| pp v }
#=> 3
#   2
#   1

(1..3).reverse_each(10) { |a, b| pp [a, b] }