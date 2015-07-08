#!/usr/bin/env ruby

generation = case birthyear
when 1946...1963: "Baby Boomer"
when 1964...1980: "Generation X"
when 1980...2000: "Millenial"
else nil
end
