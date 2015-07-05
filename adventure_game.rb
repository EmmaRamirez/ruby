#!/usr/bin/env ruby

require_relative 'ag_load_game.rb'
require_relative 'ag_hero.rb'
require_relative 'ag_hero_classes.rb'

current_exploration = ''
explore_choice = ''

# game intro screen
load_game_intro

puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?"
name = gets.chomp
puts "Hmm... #{name}? What a strange name.\nWhat class do you belong to?"
puts "[1] Mage [2] Knight [3] Warrior"
hero_class = gets.to_i
if (name != nil)
  if (hero_class == 1)
    name = Hero.new(name, 100, 'Mage')
  elsif (hero_class == 2)
    name = Hero.new(name, 100, 'Knight')
  elsif (hero_class == 3)
    name = Hero.new(name, 100, 'Warrior')
  else
    # default to mage
    name = Hero.new(name, 100, 'Mage')
  end
end

puts "Beginning adventure..."
name.status

def explore_message(place)
  puts "You decided to explore the " + place
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
    puts "Sorry, I didn't quite catch that. Only enter a number."
    explore
  end
  return explore_choice
end

explore

def event(num)
  num = rand(num)
end

puts "While exploring the " + explore_choice + ", you run into a !!!"
