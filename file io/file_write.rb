#!/usr/bin/env ruby

file_a = File.open("data/file_test_2.txt", "w")

puts "Please enter a line of text"
line = gets()
file_a.puts(line)
file_a.close()

file_b = File.open("data/file_test_2.txt", "r")
puts "Contents of file: "
puts file_b.gets()
file_b.close()
