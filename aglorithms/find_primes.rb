#!/usr/bin/env ruby

# init counter
i = 1
puts "Enter a positive integer"
n = gets.to_i
# i: [0, 100]
while (i <= n)
  # init: prime flag
  prime_flag = true
  j = 2
  # Test divisibility of i from [0, i/2]
  while (j <= i / 2)
    # puts " i ==> " + i.to_s + " j ==> " j.to_s
    if (i % j == 0)
      prime_flag = false
      break
    end
    j = j + 1
  end
  # We found a prime!
  if prime_flag
    puts "Prime ==> " + i.to_s
  end
  # Increment counter
  i += 1
end
