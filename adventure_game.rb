#!/usr/bin/env ruby

require_relative 'ag_load_game.rb'
require_relative 'ag_hero.rb'

current_exploration = ''
explore_choice = ''
$seed = rand(3)

# game intro screen
load_game_intro

puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?\n"

def reminder
  puts "Sorry, I didn't quite catch that. Only enter a number."
end

def are_you_sure?
  while true
    print "Are you sure? [y/n]: "
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
  puts "Hmm... #{$name}? What a strange name."
end

def ask_for_caste
  puts "What class do you belong to?"
  puts "[1] Mage [2] Knight [3] Warrior"
  hero_class = gets.to_i
  if ($name != nil)
    $name = Hero.new($name, 100, 0, 1, '')
    if (hero_class == 1)
      $name.set_class('Mage')
      puts "Oh, a mage! So you must really like magic, correct?"
      ensure_caste
    elsif (hero_class == 2)
      $name.set_class('Knight')
      puts "Oh, a mage! So you must really like defense, correct?"
      ensure_caste
    elsif (hero_class == 3)
      $name.set_class('Warrior')
      puts "Oh, a mage! So you must really like strength, correct?"
      ensure_caste
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
  case area
  when 'forest'
    num = rand(3) - 1
    forestMonsters = ['Imp', 'Beehive', 'Argos']
    return forestMonsters[num]
  end
end

def fight_decision
  puts "What will you do?"
  puts "[1] Fight [2] Flee [3] Bribe"
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
