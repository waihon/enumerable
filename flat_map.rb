# flat_map { |obj| block } → array
# flat_map → an_enumerator
#
# Returns a new array with the concatenated results of running block once 
# for every element in enum.
#
# If no block is given, an enumerator is returned instead.
#
# flat_map and collect_concat are two names for the same method.