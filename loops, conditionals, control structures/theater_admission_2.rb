#!/usr/bin/env ruby

# This works similarly
# except it uses the same price
# for both young and old customers
puts "Enter the customer's age: "
age = gets.to_i

if ((age <= 12) or (age >= 65))
  cost = 9
else
  cost = 18
end

puts "Ticket cost: " + cost.to_s
