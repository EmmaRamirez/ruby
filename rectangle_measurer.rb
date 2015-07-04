#!usr/bin/env ruby

# Asks user for length and width
# Then calcualtes area and outputs result
puts "What is the length of the rectangle?"
rectangle_length = gets
puts "What is the width of the rectangle?"
rectangle_width = gets
puts "Calculating area..."
puts "area = #{(rectangle_width.to_i * rectangle_length.to_i)}"
