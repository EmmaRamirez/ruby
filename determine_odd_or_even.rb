#!/usr/bin/env ruby

# Asks user for integer
# Then uses modulus to determine
# if the number is odd or even
# (And yes, zero is even)
puts "Enter an integer"
int = gets.to_i
if (int % 2 == 0)
  puts "The number is even."
else
  puts "The number is odd."
end
