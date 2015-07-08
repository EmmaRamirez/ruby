#!/usr/bin/env ruby

# The UnitPulse function, d[n] works by retuning
# 1 when n is 0, and 0 when is any other integer
def UnitPulse
  puts "Enter integer"
  int = gets.to_i
  if int == 0
    pulse = 1
  else
    pulse = 0
  end
  return pulse
end

puts UnitPulse
