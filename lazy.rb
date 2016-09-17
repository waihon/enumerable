# lazy → lazy_enumerator
# 
# Returns a lazy enumerator, whose methods map/collect, flat_map/collect_concat, 
# select/find_all, reject, grep, zip, take, #take_while, drop, and #drop_while 
# enumerate values only on an as-needed basis. 
# However, if a block is given to zip, values are enumerated immediately.

require 'pp'

def pythagorean_triples
  (1..Float::INFINITY).lazy.flat_map { |z|
    (1..z).flat_map { |x| 
      (x+1..z).select { |y|
        x**2 + y**2 == z**2
      }.map { |y|
        [x, y, z]
      }
    }
  }
end

# Show first 10 pythagorean triples
pp pythagorean_triples.take(10).force   # take is lazy, so force is needed
#=> [[3, 4, 5],
#   [6, 8, 10],
#   [5, 12, 13],
#   [9, 12, 15],
#   [8, 15, 17],
#   [12, 16, 20],
#   [7, 24, 25],
#   [15, 20, 25],
#   [10, 24, 26],
#   [20, 21, 29]]

pp pythagorean_triples.first(10)        # first is eager
#=> [[3, 4, 5],
#   [6, 8, 10],
#   [5, 12, 13],
#   [9, 12, 15],
#   [8, 15, 17],
#   [12, 16, 20],
#   [7, 24, 25],
#   [15, 20, 25],
#   [10, 24, 26],
#   [20, 21, 29]]

# Show pythagorean triples less than 100
pp pythagorean_triples.take_while { |*, z| z < 100 }.force
# or
#pp pythagorean_triples.take_while { |x, y, z| z < 100 }.force
#=> [[3, 4, 5],
#   [6, 8, 10],
#   [5, 12, 13],
#   [9, 12, 15],
#   [8, 15, 17],
#   [12, 16, 20],
#   [7, 24, 25],
#   [15, 20, 25],
#   [10, 24, 26],
#   [20, 21, 29],
#   [18, 24, 30],
#   [16, 30, 34],
#   [21, 28, 35],
#   [12, 35, 37],
#   [15, 36, 39],
#   [24, 32, 40],
#   [9, 40, 41],
#   [27, 36, 45],
#   [14, 48, 50],
#   [30, 40, 50],
#   [24, 45, 51],
#   [20, 48, 52],
#   [28, 45, 53],
#   [33, 44, 55],
#   [40, 42, 58],
#   [36, 48, 60],
#   [11, 60, 61],
#   [16, 63, 65],
#   [25, 60, 65],
#   [33, 56, 65],
#   [39, 52, 65],
#   [32, 60, 68],
#   [42, 56, 70],
#   [48, 55, 73],
#   [24, 70, 74],
#   [21, 72, 75],
#   [45, 60, 75],
#   [30, 72, 78],
#   [48, 64, 80],
#   [18, 80, 82],
#   [13, 84, 85],
#   [36, 77, 85],
#   [40, 75, 85],
#   [51, 68, 85],
#   [60, 63, 87],
#   [39, 80, 89],
#   [54, 72, 90],
#   [35, 84, 91],
#   [57, 76, 95],
#   [65, 72, 97]]