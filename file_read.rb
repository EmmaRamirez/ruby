#!/usr/bin/env ruby

my_file = File.open("data/file_test_1.txt", "r")
whole_file = ""

while (input_line = my_file.gets)
  whole_file += input_line
end

puts "Contents of input file: "
puts whole_file
my_file.close()
