#!/usr/bin/env ruby

require_relative 'ag_load_game.rb'
require_relative 'ag_hero.rb'

current_exploration = ''
explore_choice = ''


# game intro screen
load_game_intro

puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?"

def reminder
  puts "Sorry, I didn't quite catch that. Only enter a number."
end

def ask_for_name
  name = gets.chomp
  puts "Hmm... #{name}? What a strange name.\nWhat class do you belong to?"
  puts "[1] Mage [2] Knight [3] Warrior"
  hero_class = gets.to_i
  if (name != nil)
    name = Hero.new(name, 100, 0, 1, '')
    if (hero_class == 1)
      name.set_class('Mage')
    elsif (hero_class == 2)
      name.set_class('Knight')
    elsif (hero_class == 3)
      name.set_class('Warrior')
    else
      reminder
      ask_for_name
    end
  end
  puts "Beginning adventure..."
  name.status
end

ask_for_name


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
    reminder
    explore
  end
  puts "While exploring the " + current_exploration + ", you run into a !!!"
end

explore

def event(num)
  num = rand(num)
end
