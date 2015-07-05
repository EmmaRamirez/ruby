#!/usr/bin/env ruby

def leet_speak
  puts "Enter text: "
  text = gets.to_s
  # uses gsub to substitute the characters given in a regexp
  # into the ones provided in the hash  
  text = text.gsub(/[eoEOtlLsS]/, 'e' => 3, 'E' => 3, 'o' => 0, 'O' => 0, 't' => 7, 'l' => 1, 'L' => 1, 's' => 5, 'S' => 5)
  puts text
end

puts leet_speak
