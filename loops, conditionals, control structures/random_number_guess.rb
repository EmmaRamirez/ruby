#!user/bin/env ruby

num = rand(10)
print "Guess the Number! "
guess = gets.to_i
if guess > num
  print "Too high! Guess again!"
end
if guess < num
  print "Too low! Guess again!"
end
if guess == num
  print "Correct!"
end
