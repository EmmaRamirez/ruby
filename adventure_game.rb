#!/usr/bin/env ruby

require_relative 'ag_load_file.rb'
require_relative 'ag_hero.rb'
require_relative 'ag_monster.rb'
# require_relative 'ag_controls.rb'

current_exploration = ''
explore_choice = ''
$num_of_turns = 0
$seed = rand(3)
$current_monster = ''
$areas_unlocked = ['forest', 'desert', 'plains']

# game intro screen
load_file("data/adventure_1.txt")

# puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?\n"

# This function is used so that the user isn't overwhelmed with a giant
# block of text all at once...usually!
# might just be the most important method in the game
def enter
  enter = gets
end

# TODO: implement --h command at anytime
def help
  load_file("data/adventure_3.txt")
  enter
end

def reminder
  puts "Sorry, I didn't quite catch that. Only enter a number."
end

def check_status
  $name.status
end

def sleep
  $name.set_hp(100)
  puts "#{$name.name} went to sleep for one helluva long time."
  enter
  puts "#{$name.name} became fully healed!"
end

def nap
  $name.edit_hp(33)
  puts "#{$name.name} took a nap and recovered 33 HP! Feeling so refreshed!"
end

def are_you_sure?
  while true
    print "Correct? [y/n]: "
    response = gets
    case response
    when /^[yY]/
      return true
    when /^[nN]/, /^$/
      return false
    end
  end
end

def get_name
  $name = gets.chomp
  puts "Hmm... #{$name}? What a strange name. Well, then let me ask you..."
  enter
end

def ask_for_caste
  puts "What class do you belong to?"
  puts "[1] Mage [2] Knight [3] Warrior"
  hero_class = gets.to_i
  if ($name != nil)
    $name = Hero.new($name, 100, 0, 1, '', [], 50, 10, 10, 10)
    if (hero_class == 1)
      $name.set_class('Mage')
      puts "Oh, a mage! So you must really like magic."
      ensure_caste
      $name.edit_powers((-3), 5, 0)
    elsif (hero_class == 2)
      $name.set_class('Knight')
      puts "Oh, a knight! So you must really like defense."
      ensure_caste
      $name.edit_powers((-3), 0, 5)
    elsif (hero_class == 3)
      $name.set_class('Warrior')
      puts "Oh, a warrior! So you must really like strength."
      ensure_caste
      $name.edit_powers(3, (-5), 0)
    else
      reminder
      ask_for_caste
    end
  end
  puts "Beginning adventure..."
  enter
  $name.status
  enter
end

def ensure_caste
  if are_you_sure? == true
    puts "Great!"
  else
    puts "Oh...my bad, then."
    ask_for_caste
  end
end

get_name
ask_for_caste





def explore_message(place)
  puts "You decide to explore the " + place + "..."
  enter
end

def summon_monster(area)
  num = rand(3) - 1
  case area
  when 'forest'
    forestMonsters = ['Imp', 'Sentient Beehive', 'Mad Wombat']
    $current_monster = Monster.new(forestMonsters[num], 5)
    return forestMonsters[num]
  when 'desert'
    desertMonsters = ['Sand Snake', 'Jackal', 'Evil Kangaroo']
    $current_monster = Monster.new(desertMonsters[num], 5)
    return desertMonsters[num]
  when 'plains'
    plainsMonsters = ['Imp', 'Imp', 'Impster']
    $current_monster = Monster.new(plainsMonsters[num], 5)
    return plainsMonsters[num]
  end
end

def calculate_bribe_cost
  $name.access_level * 100
end

def game_over
  load_file("data/adventure_1.txt")
end

def flee
  puts "You decided to flee!"
end

def fight_screen
  puts "+------------------+"
  puts "|    F I G H T!    |"
  puts "+------------------+"
end

def fight_spoils
  # 20% chance of receiving item after battle
  num = rand(5)

  if num = 1
    puts "In the rubble of the fight, you found..."
    if ($current_monster.species == "Imp")
      $name.inventory_add("Tiny Sword")
      puts "A tiny sword!"
    else
      $name.inventory_add("Tiny Sword")
      puts "An Olixir Potion!"
    end
  end
end

def fight_attack_monster
  base_damage = 5
  monster_strength_mod = 0
  hero_defense_mod = 0
  hero_defense_divsion_mod = 3

  damage = (base_damage + $current_monster.strength + rand(5) - ($name.defense / hero_defense_divsion_mod)) * -1
  $name.edit_hp(damage)
  puts "|| The #{$current_monster.species} attacked back!"
  puts "|| It inflicted #{damage * -1} damage!"

  if $name.hp < 0
    puts "***********************\n   You lost all your health!  \n************************"
    game_over
  elsif $name.hp < 20
    puts "|| You have #{$name.hp + damage} HP left..."
    puts "|| Maybe you should flee.\n [1] Flee [2] Keep Fighting"
    answer = gets.to_i
    if answer == 1
      puts " "
      puts "You decided to flee!"
    elsif answer == 2
      fight_attack
    else
      # TODO: FIND SOMETHING TO PUT HERE
    end
  else
    puts "|| You have #{$name.hp + damage} HP left."
    enter
    fight_attack
  end
end

def fight_attack
  base_damage = 10
  hero_strength_mod = 0
  # Get Strength & Defense of Hero
  # Get Strength of Monster
  if $name.inventory.length > 0
    puts "You attacked the monster with your " + $name.inventory[0].to_s
  else
    puts "You attacked the monster!"
  end

  # TODO: either add damage or strength boosters for inventory weapons
  # TODO: add critical hit ratio & implementation
  damage = (base_damage + rand(10) + $name.strength) * -1
  $current_monster.edit_hp(damage)

  if $current_monster.hp < 0
    $current_monster.set_hp(0)
  end

  puts "You inflicted #{damage * -1} damage!"
  # for debugging
  puts "The #{$current_monster.species} has " + $current_monster.hp.to_s + " HP left."
  enter

  if $current_monster.hp <= 0
    gems_acquired = $current_monster.strength * 2
    $name.edit_gems(gems_acquired)
    exp_acquired = $current_monster.strength * 5
    $name.edit_exp(exp_acquired)
    puts "Congratulations! You defeated the monster!!"
    puts "You gained #{exp_acquired.to_s} exp! [#{$name.exp.to_s} total]"
    # TODO: make check_exp function that calls the method
    $name.check_exp
    puts "You picked up #{gems_acquired.to_s} gems!"
    puts "You now have a total of #{$name.access_gems.to_s} gems."
    fight_spoils
    enter
  else
    fight_attack_monster
  end

end


# REVIEW: adding more prize money if the bribe was declined
# or the Hero didn't have enough money
def fight(monster)
  fight_screen_shown = false
  mon = monster

  if fight_screen_shown == false
    fight_screen
    fight_screen_shown = true
  end

  puts "[1] Attack [2] Use Spell"
  offense_choice = gets.to_i

  # REVIEW: making this o_c != 2 instead
  if offense_choice == 1
    fight_attack
  elsif offense_choice == 2
    fight_spell
  else
    fight_attack
  end



end



def fight_decision
  puts "What will you do?"
  puts "[1] Fight [2] Flee [3] Bribe"
  fight_response = gets.to_i
  if fight_response == 1
    fight($current_monster)
  elsif fight_response == 2
    puts "You decided to flee!"
  elsif fight_response == 3

    puts "You offer the #{$current_monster.species} a bribe."
    if (calculate_bribe_cost > $name.access_gems)
      puts "But you don't have enought money!"
      puts "The #{$current_monster.species} attacked!"
      enter
      fight($current_monster)
    else
      $name.edit_gems((calculate_bribe_cost * -1))
      puts "Good thing you had the money!\nThe #{$current_monster.species} left in peace."
    end
  else
    puts "Sorry, I didn't quite catch that..."
    fight_decision
  end
end

def explore
  puts "What will you do first?"
  puts "[1] Explore Forest\n[2] Explore Desert\n[3] Explore Plains"
  explore_choice = gets.to_i
  if (explore_choice == 1)
    current_exploration = 'forest'
    explore_message('forest')
  elsif (explore_choice == 2)
    current_exploration = 'desert'
    explore_message('desert')
  elsif (explore_choice == 3)
    current_exploration = 'plains'
    explore_message('plains')
  else
    reminder
    explore
  end
  # TODO: Implement correct grammar for 'an' instead of 'a' Imp, etc
  $current_monster = Monster.new(summon_monster(current_exploration), 5)
  puts "While exploring the " + current_exploration + ", you run into a #{$current_monster.species}!!"
  enter
  fight_decision
end

explore

def home
  puts "You decided to settle down for a bit."
  $num_of_turns += 1
  allow_sleep = false
  if $num_of_turns == 1
    puts "The day is young. The sun sings. There is still morning dew."
  elsif $num_of_turns == 2
    puts "The noon is now. Birds sing cheerful tunes."
  elsif $num_of_turns == 3
    puts "The sun is setting. A truly gorgeous horizon."
    allow_sleep = true
  elsif $num_of_turns == 4
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

home
