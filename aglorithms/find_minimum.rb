#!/usr/bin/env ruby

# Initialize array and loop values
arr = [34, 55, 23, 99, 33, 2]
index = 0
min = 0

# Loop over each element in arr
while index < arr.size
  if arr[index] < min
    # Update max
    min = arr[index]
  end
  index = index + 1
end

# Output calculated max
puts "Min ==> " + min.to_s
