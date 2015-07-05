#!/usr/bin/env ruby

def file_open
  puts "Specify a file path: "
  file_name = gets.chomp.to_s
  my_file = File.open(file_name, "r")
  whole_file = ""
  puts file_name

  while (input_line = my_file.gets)
    whole_file += input_line
  end

  puts "Contents of input file: "
  puts whole_file
  my_file.close()
end

puts file_open
