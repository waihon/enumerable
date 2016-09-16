# group_by { |obj| block } → a_hash
# group_by → an_enumerator
#
# Groups the collection by result of the block. Returns a hash where the keys are 
# the evaluated result from the block and the values are arrays of elements in 
# the collection that correspond to the key.
#
# If no block is given an enumerator is returned.

require 'pp'

hash = (1..6).group_by { |i| i % 3 }
pp hash   #=> {1=>[1, 4], 2=>[2, 5], 0=>[3, 6]}

hash2 = IO.constants.group_by { |c| c =~ /SEEK/ }
pp hash2
#=> {nil=>
 #    [:WaitReadable,
 #     :WaitWritable,
 #     :EAGAINWaitReadable,
 #     :EAGAINWaitWritable,
 #     :EWOULDBLOCKWaitReadable,
 #     :EWOULDBLOCKWaitWritable,
 #     :EINPROGRESSWaitReadable,
 #     :EINPROGRESSWaitWritable,
 #     :RDONLY,
 #     :WRONLY,
 #     :RDWR,
 #     :APPEND,
 #     :CREAT,
 #     :EXCL,
 #     :NONBLOCK,
 #     :TRUNC,
 #     :NOCTTY,
 #     :BINARY,
 #     :SYNC,
 #     :DSYNC,
 #     :NOFOLLOW,
 #     :LOCK_SH,
 #     :LOCK_EX,
 #     :LOCK_UN,
 #     :LOCK_NB,
 #     :NULL,
 #     :FNM_NOESCAPE,
 #     :FNM_PATHNAME,
 #     :FNM_DOTMATCH,
 #     :FNM_CASEFOLD,
 #     :FNM_EXTGLOB,
 #     :FNM_SYSCASE],
 #   0=>[:SEEK_SET, :SEEK_CUR, :SEEK_END]}