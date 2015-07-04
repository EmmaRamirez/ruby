#!/usr/bin/env ruby

# Initialize array and loop values
arr = [[34, 23, 44, 53, 44],
       [33, 44, 22, 45, 67],
       [89, 56, 31, 12, 23]]
row = 0
column = 0

# Loop over each row
while (row < arr.size)
  puts "Row: " + row.to_s
  # Loop over each column
  while (column < arr[row].size)
    # Prints the item at pos row x column
    puts arr[row][column]
    column = column + 1
  end
  # Reset column, advance row
  column = 0
  row = row + 1
end
