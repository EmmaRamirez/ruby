#!/usr/bin/env ruby

require_relative 'ag_load_game.rb'
require_relative 'ag_hero.rb'

current_exploration = ''
explore_choice = ''
$seed = rand(3)
$current_monster = ''
$areas_unlocked = ['forest', 'desert', 'plains']

# game intro screen
load_game_intro

puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?\n"

def reminder
  puts "Sorry, I didn't quite catch that. Only enter a number."
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
      $name.edit_powers(5, (-3), 0)
    else
      reminder
      ask_for_caste
    end
  end
  puts "Beginning adventure..."
  $name.status
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
  puts "You decided to explore the " + place + "..."
end

def summon_monster(area)
  num = rand(3) - 1
  case area
  when 'forest'
    forestMonsters = ['Imp', 'Beehive', 'Argos']
    $current_monster = forestMonsters[num]
    return forestMonsters[num]
  when 'desert'
    desertMonsters = ['Sand Snake', 'Jackal', 'Evil Kangaroo']
    return desertMonsters[num]
  when 'plains'
    plainsMonsters = ['Imp', 'Imp', 'Impster']
    return plainsMonsters[num]
  end
end

def calculate_bribe_cost
  $name.access_level * 100
end

def fight_decision
  puts "What will you do?"
  puts "[1] Fight [2] Flee [3] Bribe"
  fight_response = gets.to_i
  if fight_response == 1
    fight
  elsif fight_response == 2
    puts "You decided to flee!"
  elsif fight_response == 3
    puts "You offer the #{$current_monster} a bribe."

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
  puts "While exploring the " + current_exploration + ", you run into a #{summon_monster(current_exploration)}!!"
  fight_decision
end

explore
