#!/usr/bin/env ruby

# Prints "What is your name?"
# Then, takes user input
# the method .chomp removes the line break
# Then, it prints Hello plus the name entered
print "What is your name? "
name = gets.chomp
puts "Hello #{name}!"
