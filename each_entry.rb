# each_entry { |obj| block } → enum
# each_entry → an_enumerator
# 
# Calls block once for each element in self, passing that element as a parameter, 
# converting multiple values from yield to an array.
#
# If no block is given, an enumerator is returned instead.

require 'pp'

class Foo
  include Enumerable
  def each
    yield 1
    yield 1, 2
    yield
  end
end

Foo.new.each_entry { |param| pp param }
