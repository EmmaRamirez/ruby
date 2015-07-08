#!/usr/bin/env ruby

# Initialize array and loop values
arr = [34, 55, 23, 99, 33, 2]
index = 0
max = 0

# Loop over each element in arr
while index < arr.size
  if arr[index] > max
    # Update max
    max = arr[index]
  end
  index = index + 1
end

# Output calculated max
puts "Max ==> " + max.to_s
