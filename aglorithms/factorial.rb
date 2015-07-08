#!/usr/bin/env ruby

# asks for user input greater than 0
puts "Enter a number >= 0:"
n = gets.to_i
a = 1
# while n is greater than 1...
while (n > 1)
  # a equals n * (n - 1) * 1 or a
  a = (n * (n - 1)) * a
  # n equals n - 2
  n = n - 2
end
puts a
