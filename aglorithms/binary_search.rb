#!/usr/bin/env ruby

NUM_STUDENTS = 30
MAX_GRADE = 100
arr = Array.new(NUM_STUDENTS)
puts "This is a binary search example. What number between 1 and 100 do you want to look for?"
value_to_find = gets.to_i
low = 0
high = NUM_STUDENTS + 1
middle = (low + high) / 2
found = false

# Populate array with random grades
for i in (0..NUM_STUDENTS - 1)
  new_value = rand(MAX_GRADE + 1)
  # ensure new value is unique
  while (arr.include?(new_value))
    new_value = rand(MAX_GRADE + 1)
  end
  arr[i] = new_value
end
# Sort the array
arr.sort!

print "Input List: "
for i in (0..NUM_STUDENTS - 1)
  puts "arr[" + i.to_s + "] ==> " + arr[i].to_s
end

# THE MEAT
while ((low <= high) and (not found))
  middle = (low + high) / 2
  # found
  if arr[middle] == value_to_find
    puts "Found grade " + value_to_find.to_s + "% at position " + middle.to_s
    found = true
  end

  # If the value should be lower than middle, search lower
  # otherwise, search the upper half
  if arr[middle] < value_to_find
    low = middle + 1
  else
    high = middle - 1
  end
end

if (not found)
  puts "There is no grade of " + value_to_find.to_s + "% in dataset."
end
