#!/usr/bin/env ruby

require_relative 'ag_load_file.rb'
require_relative 'ag_hero.rb'
require_relative 'ag_monster.rb'
require_relative 'ag_helper_functions.rb'
require_relative 'ag_explore.rb'
require_relative 'ag_home.rb'
require_relative 'ag_fight.rb'
require_relative 'ag_market.rb'
# require_relative 'ag_controls.rb'

current_exploration = ''
explore_choice = ''
$num_of_turns = 0
$num_mons_killed = 0
$seed = rand(3)
$current_monster = ''
$areas_unlocked = ['forest', 'desert', 'plains']
$market_ul = false
$hero = ''

# game intro screen
load_file("data/adventure_1.txt")

# puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?\n"

# This function is used so that the user isn't overwhelmed with a giant
# block of text all at once...usually!
# might just be the most important method in the game

def ask_for_caste
  puts "What class do you belong to?"
  puts "[1] Mage [2] Knight [3] Warrior"
  caste = gets.chomp.downcase
  $hero = Hero.new($hero_name, 100, 100, 0, 1, '', [], 50, 10, 10, 10)
  if (caste == "1" or caste == "Mage".downcase)
    $hero.caste = "Mage"
    puts "Oh, a mage! So you must really like magic."
    ensure_caste
    $hero.edit_powers((-3), 5, 0)
  elsif (caste == "2" or caste == "Knight".downcase)
    $hero.caste = "Knight"
    puts "Oh, a knight! So you must really like defense."
    ensure_caste
    $hero.edit_powers((-3), 0, 5)
  elsif (caste == "3" or caste == "Warrior".downcase)
    $hero.caste = "Warrior"
    puts "Oh, a warrior! So you must really like strength."
    ensure_caste
    $hero.edit_powers(3, (-5), 0)
  else
    reminder
    ask_for_caste
  end
  beginning
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

















explore

home

def add_item(item)
  $hero.inventory_add(item.to_s)
  puts "You acquired a #{item.downcase}!"
end
