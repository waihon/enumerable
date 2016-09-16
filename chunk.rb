require 'pp'

# chunk { |elt| ... } → an_enumerator
# chunk(initial_state) { |elt, state| ... } → an_enumerator
# 
# Enumerates over the items, chunking them together based on the return value of the block.
# Consecutive elements which return the same block value are chunked together.
#
# If the block needs to maintain state over multiple elements, an initial_state argument 
# can be used. If a non-nil value is given, a reference to it is passed as the 2nd argument 
# of the block for the chunk method, so state-changes to it persist across block calls.

enum = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunk { |n| n.even? }
enum.each { |even, array| pp [even, array] }
#=> [false, [3, 1]]
#   [true, [4]]
#   [false, [1, 5, 9]]
#   [true, [2, 6]]
#   [false, [5, 3, 5]]

open("/usr/share/dict/words", "r:iso-8859-1") { |f|
  #f.lines.each { |line| pp line }
  #=> "A\n"
  #   "a\n"
  #   "aa\n"
  #   "aal\n"
  #   "aalii\n"
  #   "aam\n"
  #   "Aani\n"
  #   "aardvark\n"
  #   "aardwolf\n"  
  #   ...
  
  #f.chunk { |line| line.ord }.each { |ch, lines| p [ch.chr, lines.size] }
  #=> ["A", 1]
  #   ["a", 5]
  #   ["A", 1]
  #   ["a", 2]
  #   ...
  
  #f.chunk { |line| line.upcase.ord }.each { |ch, lines| p [ch.chr, lines.size] }
  #=> ["A", 17096]
  #   ["B", 11070]
  #   ["C", 19901]
  #   ["D", 10896]
  #   ["E", 8736]
  #    ...
}

# nil and :_separator specifies that the elements should be dropped.
#sep = "-"*72 + "\n"
#IO.popen("svn log README") { |f|
sep = "\n"
IO.popen("git log") { |f|
  f.chunk { |line|
    line != sep || :_separator # or nil
  }.each { |_, lines|
    pp lines
  }
}
# => ["commit 2785addfafda9552f144ebc484043ac8a38c8612\n",
#     "Author: Waihon Yew <yewwaihon@gmail.com>\n",
#     "Date:   Fri Sep 16 13:20:38 2016 +0800\n"]
#    ["    Initial commit\n"]

# Paragraphs separate any empty lines can be parsed as follows:
File.foreach("README").chunk { |line|
  #/\A\s*\z/ !~ line || :_separator
  # or
  line !~ /\A\s*\z/ || :_separator # or nil
}.each { |_, lines|
  pp lines
}
#=> ["Blocks\n", "Exercises\n", "http://facebook.com/waihonpage\n"]
#   ["Objective\n",
#    "Blocks are a fundamental, and powerful, aspect of the Ruby language. You'll find blocks used pervasively throughout good Ruby programs. And many of the methods found in the Ruby standard library itself take blocks. To be an effective Ruby programmer you must become a master blocks builder!\n",
#    "http://www.pragmaticstudio.com\n"]
#   ["In this exercise, we'll use blocks as iterators to help us do three things:\n"]
#   ...

# :_alone specifies that the element should be chunked by itself.
pattern = /http/
File.foreach("README").chunk { |line|
  line =~ pattern ? :_alone : true
}.each { |key, lines|
  pp lines
}
#=> ["Blocks\n", "Exercises\n"]
#   ["http://facebook.com/waihonpage\n"]
#   ["\n",
#    "Objective\n",
#    "Blocks are a fundamental, and powerful, aspect of the Ruby language. You'll find blocks used pervasively throughout good Ruby programs. And many of the methods found in the Ruby standard library itself take blocks. To be an effective Ruby programmer you must become a master blocks builder!\n"]
#   ["http://www.pragmaticstudio.com\n"]


# Any other symbols that begin with an underscore will raise an error.