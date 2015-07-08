#!/usr/bin/env ruby

def three_words
  puts "Enter three words: "
  words = gets
  new_words = words.split(" ")
  average = (new_words[0].length + new_words[1].length + new_words[2].length) / 3
  puts "Total # of characters: " + words.length.to_s
  puts "Avg # of characters per word " + average.to_s
end

puts three_words
