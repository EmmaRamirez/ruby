#!/usr/bin/env ruby

# Creates two for loops inside one another
# Then prints the result of each
for i in (1..3)
  puts "Outer loop: i = " + i.to_s
  for k in (1..4)
    puts "Inner loop: k = " + k.to_s
  end
end
