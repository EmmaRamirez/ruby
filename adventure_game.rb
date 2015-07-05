#!/usr/bin/env ruby

require_relative 'ag_load_game.rb'
require_relative 'ag_hero.rb'
require_relative 'ag_hero_classes.rb'

# game intro screen
load_game_intro

puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?"
name = gets.chomp
puts "What class do you belong to?"
puts "[1] Mage [2] Knight [3] Warrior"
hero_class = gets.to_i
if (name != nil)
  if (hero_class == 1)
    name = Mage.new(name)
  elsif (hero_class == 2)
    name = Knight.new(name)
  elsif (hero_class == 3)
    name = Warrior.new(name)
  else
    name = Hero.new(name)
  end
end
