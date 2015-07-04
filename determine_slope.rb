#!usr/bin/env ruby

# The function calculateSlope
# asks user for two x,y coordinates
# Then splits each coordinate into an array
# Using the map method, converts them to a float
# Then each part of the array is assigned
# either x1, x2, y1, or y2
# Then, the slop itself is calculated
# After that, we determine if the slope is positive, negative, or neither 
def calculateSlope
  puts "Enter first coordinate: x,y"
  first_coord = gets.split(",").map { |s| s.to_f }
  puts "Enter second coordinate: x,y"
  second_coord = gets.split(",").map { |s| s.to_f }
  x1 = first_coord[0]
  y1 = first_coord[1]
  x2 = second_coord[0]
  y2 = second_coord[1]
  slope = (y2 - y1) / (x2 - x1)
  if slope > 0
    slope_sign = "positive"
  elsif slope < 0
    slope_sign = "negative"
  else
    slope_sign = "neither positive nor negative"
  end
  return "The slope is #{slope} and #{slope_sign}."
end
puts calculateSlope
