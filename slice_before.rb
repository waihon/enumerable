# slice_before(pattern) → an_enumerator
# slice_before { |elt| bool } → an_enumerator
# slice_before(initial_state) { |elt, state| bool } → an_enumerator
#
# Creates an enumerator for each chunked elements. The beginnings of chunks 
# are defined by pattern and the block.
#
# If pattern === elt returns true or the block returns true for the element, 
# the element is beginning of a chunk.
#
# The === and block is called from the first element to the last element of enum. 
# The result for the first element is ignored.
#
# The result enumerator yields the chunked elements as an array. 
# So each method can be called as follows:
#
# enum.slice_before(pattern).each { |ary| ... }
# enum.slice_before { |elt| bool }.each { |ary| ... }
# enum.slice_before(initial_state) { |elt, state| bool }.each { |ary| ... }
#
# Other methods of the Enumerator class and Enumerable module, such as 
# map, etc., are also usable.

require 'pp'

(1..10).slice_before { |num| num % 3 == 0 }.each { |ary| pp ary }
#=> [1, 2]
#   [3, 4, 5]
#   [6, 7, 8]
#   [9, 10]

IO.popen("git log") { |f| 
  f.slice_before(/\Acommit/).each { |ary| pp ary }
}
#=> ["commit abb49d46e4c5a63dd9e87d761633612de82645ba\n",
#    "Author: Waihon Yew <yewwaihon@gmail.com>\n",
#    "Date:   Sat Sep 17 20:50:15 2016 +0800\n",
#    "\n",
#    "    Complete select\n",
#    "\n"]
#   ["commit 23f74dfaf8f8d1515c231736c9fcfbd79f94b5fb\n",
#    "Author: Waihon Yew <yewwaihon@gmail.com>\n",
#    "Date:   Sat Sep 17 20:48:12 2016 +0800\n",
#    "\n",
#    "    Complete reverse_each\n",
#    "\n"]
#   ...

# Same as above. Block is used instead of pattern argument.
IO.popen("git log") { |f|
  f.slice_before { |line| line === /\Acommit/ }.each { |ary| pp ary }
}

# If the block needs to maintain state over multiple elements, 
# local variables can be used. For example, three or more consecutive 
# increasing numbers can be squashed as follows:
ary = [0, 2, 3, 4, 6, 7, 9]
prev = ary[0]
p ary.slice_before { |current|
  prev, prev2 = current, prev
  prev2 + 1 != current
}.map { |sliced_ary|
  sliced_ary.length < 2 ? sliced_ary.join(",") : "#{sliced_ary.first}-#{sliced_ary.last}"
}.join(",")
#=> "0,2-4,6-7,9"

# Word wrapping. This assumes all characters have same width.
def wordwrap(words, maxwidth)
  # if cols is a local variable, 2nd "each" may start with non-zero cols.
  words.slice_before(cols: 0) { |word, hash| 
    hash[:cols] += 1 if hash[:cols] != 0
    hash[:cols] += word.length
    if hash[:cols] > maxwidth
      hash[:cols] = word.length
      true
    else
      false
    end
  }
end

text = (1..20).to_a.join(" ")
words = text.split(/\s+/) # whitespace
#=> => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
enum = wordwrap(words, 10)

enum.each { |ws| pp ws }
#=> ["1", "2", "3", "4", "5"]
#   ["6", "7", "8", "9", "10"]
#   ["11", "12", "13"]
#   ["14", "15", "16"]
#   ["17", "18", "19"]
#   ["20"]

puts "-"*10
enum.each { |ws| puts ws.join(" ") }
puts "-"*10
#=> ----------
#   1 2 3 4 5
#   6 7 8 9 10
#   11 12 13
#   14 15 16
#   17 18 19
#   20
# ----------

# Parse mbox
open("mbox") { |f|
  f.slice_before { |line|
    line.start_with? "From "
  }.each { |mail|
    # Retrieve the first  element and remove it from the array
    unix_from = mail.shift
    # Retrieve array index of the next newline character
    i = mail.index("\n")
    # The header is between Unix From and the next newline character
    header = mail[0...i]
    header.to_a
    # The body is between the newline character and next mail.
    body = mail[(i+1)..-1]
    # Remove the last newline character which servers as separators
    # between emails
    body.pop if body.last == "\n"

    # Extract fields from the header. Lines that start with a space or a tab.
    # are considered part of the previous line.
    fields = header.slice_before { |line| !" \t".include?(line[0]) }.to_a

    pp "unix_from:"
    pp unix_from
    pp "header: #{header.size}"
    pp header
    pp "fields: #{fields.size}"
    pp fields
    pp "body: #{body.size}"
    pp body
  }
}

# Split mails in mbox (slice before Unix From line after an empty line)
open("mbox") { |f|
  f.slice_before(empty: true) { |line, h|
    prev_empty = h[:empty]
    h[:empty] = line == "\n"
    prev_empty && line.start_with?("From ")
  }.each { |mail|
    mail.pop if mail.last == "\n"
    pp mail
  }
}