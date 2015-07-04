#!/usr/bin/env ruby

def compound_interest
  # converts amount, interest, and periods inputs to floats
  puts "Enter amount deposited"
  amount = gets.to_f
  puts "Enter interest rate as decimal"
  interest = gets.to_f
  puts "Enter number of periods"
  periods = gets.to_f
  # set compound_amount
  compound_amount = amount
  while (periods > 0)
    # use recursion to calculate continuous interest
    compound_amount = compound_amount * (1 + interest)
    periods -= 1
  end
  return compound_amount
end

puts compound_interest
