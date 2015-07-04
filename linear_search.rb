#!/usr/bin/env ruby

NUM_STUDENTS = 35
MAX_GRADE = 100
arr = Array.new(NUM_STUDENTS)
i = 1
found = false
puts "This code produces a random array of student grades. What value do you want to search for?"
value_to_find = gets.to_i

# Randomly populate student grades into arr
for i in (0..NUM_STUDENTS - 1)
  arr[i] = rand(MAX_GRADE + 1)
end

puts "Input List:"
for i in (0..NUM_STUDENTS - 1)
  puts "arr[" + i.to_s + "] ==> " + arr[i].to_s
end

i = 0
# Loop over the list until we have found our value
while ((i < NUM_STUDENTS) and (not found))
  # We found it
  if (arr[i] == value_to_find)
    puts "Found " + value_to_find.to_s + " at position " + i.to_s + "of the list."
    found = true
  end
  i += 1
end

# If we never find it, it doesn't exist :[
if (not found)
  puts "There is no " + value_to_find.to_s + " in the list."
end
