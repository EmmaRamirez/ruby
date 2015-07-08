#!/usr/bin/env ruby

# This is reserved for the functions that ocurr at the Hero's base.

def sleep
  $hero.full_heal
  puts "#{$hero.name} went to sleep for a couple hours."
  enter
  puts "#{$hero.name} became fully healed!"
end

def nap
  $hero.edit_hp((@maxhp / 3))
  puts "#{$hero.name} took a nap and recovered 33 HP! Feeling so refreshed!"
end

def home
  puts "You decided to settle down for a bit."
  $num_of_turns += 1
  allow_sleep = false
  if $num_of_turns == 1 or $num_of_turns % 5 == 0
    puts "The day is young. The sun sings. There is still morning dew."
    # FIXME: The fact divisibility isn't the most effective tool at this
  elsif $num_of_turns == 2
    puts "The noon is now. Birds sing cheerful tunes."
  elsif $num_of_turns == 3 or $num_of_turns % 3 == 0
    puts "The sun is setting. A truly gorgeous horizon."
    allow_sleep = true
  elsif $num_of_turns == 4 or $num_of_turns %4 == 0
    puts "The night has set in. You should sleep for the night."
    allow_sleep = true
  end
  enter
  puts "What will you do?"

  if allow_sleep
    puts "[1] Check Status [2] Explore [3] Sleep [4] Help"
  else
    puts "[1] Check Status [2] Explore [3] Nap [4] Help"
  end

  response = gets.to_i

  if response == 1
    check_status
  elsif response == 2
    explore
  elsif response == 3
    if allow_sleep
      sleep
    else
      nap
    end
  elsif response == 4
    help
  end
  home

end
