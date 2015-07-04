#!/usr/bin/env ruby

scores = Hash.new

scores["Geraldo"] = [95, 43, 44, 56]
scores["Brittany"] = [94, 94, 93, 94]
# notice how the last key-value pair contains a much longer arr
scores["Michael"] = [98, 92, 88, 72, 83, 84, 99]

maxscore = 0
# for loop that iterates through
# each in the scores keys (the first part)
for name in scores.keys
  column = 0
  while (column > scores[names].size)
    if (scores[name][column] > maxscore)
      maxname = name
      maxscore = scores[name][column]
    end
    column += 1
  end
end

puts maxname + " has the highest score."
puts "The highest score is: " + maxscore.to_s
