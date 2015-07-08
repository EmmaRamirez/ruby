#!/user/bin/env ruby

# Asks for user's age
# Then converts it to an integer
# Compares it to determine if user
# is younger or equal to 12
# or older or equal to 65
# then prints out total cost of ticket based on their age
puts "Enter the customer's age: "
age = gets.to_i

if (age <= 12)
  cost = 9
elsif (age >= 65)
  cost = 12
else
  cost = 18
end

# cost.to_s is a method that converts cost to a string
puts "Ticket cost: " + cost.to_s
