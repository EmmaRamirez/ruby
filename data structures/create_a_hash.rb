#!/usr/bin/env ruby

# creates a new Hash
scores = Hash.new
# assigns the following key value pairs
scores["Katy"] = [100, 100, 99, 100, 98]
scores["Erick"] = [34, 12, 45, 55, 67]
scores["Mary"] = [34, 32, 53, 33, 12]

# prints scores as a Hash
# like { "Katy" : [100, 100, 99, 100, 98], ....}
puts scores
