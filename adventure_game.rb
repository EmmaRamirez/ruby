#!/usr/bin/env ruby

require_relative 'ag_load_file.rb'
require_relative 'ag_hero.rb'
require_relative 'ag_monster.rb'
require_relative 'ag_helper_functions.rb'
require_relative 'ag_explore.rb'
require_relative 'ag_home.rb'
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

def will_you_purchase_it?
  while true
    print "Will you purhcase it? [y/n]: "
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
  $hero_name = gets.chomp
  puts "Hmm... #{$hero_name}? What a strange name. Well, then let me ask you..."
  enter
end


def ask_for_caste
  puts "What class do you belong to?"
  puts "[1] Mage [2] Knight [3] Warrior"
  caste = gets.chomp.downcase
  if ($hero_name != nil)
    $hero = Hero.new($hero_name, 100, 100, 0, 1, '', [], 50, 10, 10, 10)
    if (caste == "1" or caste == "Mage".downcase)
      $hero.set_class('Mage')
      puts "Oh, a mage! So you must really like magic."
      ensure_caste
      $hero.edit_powers((-3), 5, 0)
    elsif (caste == "2" or caste == "Knight".downcase)
      $hero.set_class('Knight')
      puts "Oh, a knight! So you must really like defense."
      ensure_caste
      $hero.edit_powers((-3), 0, 5)
    elsif (caste == "3" or caste == "Warrior".downcase)
      $hero.set_class('Warrior')
      puts "Oh, a warrior! So you must really like strength."
      ensure_caste
      $hero.edit_powers(3, (-5), 0)
    else
      reminder
      ask_for_caste
    end
  end
  puts "Beginning adventure..."
  enter
  $hero.status
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



def add_item(item)
  $hero.inventory_add(item.to_s)
  puts "You acquired a #{item.downcase}!"
end



def calculate_bribe_cost
  $hero.access_level * 100
end







def transaction(price, item)
  if price > $hero.gems
    puts "You can't afford this!"
    return
  else
    $hero.edit_gems((price * -1))
    add_item(item)
  end
end

def ensure_purchase
  if will_you_purchase_it? == true
    return
  else
    puts "Clerk: Oh, I'm sorry! I didn't mean to show you the wrong item!"
  end
end

def market_banner
  puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
  puts "|   Welcome to the market!   |"
  puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
end

def market
  seen_market = false
  if seen_market == false
    market_banner
    seen_market = true
  end
  enter
  puts "Clerk: How may I help you?"
  puts "[1] Purchase [2] Sell"
  response = gets.to_i
  if response == 1
    puts "Clerk: Well here's what we have in-stock today..."
    puts "[1] Turtle Armor -- 50 gems\n[2] Leek Sword -- 70gems\n[3] Arizona Tea -- 80gems"
    response = gets.to_i
    if response == 1
      puts "A tiny, but useful shield in the design of a turtle. Helps take hits."
      ensure_purchase
      transaction(50, "turtle armor")
    elsif response == 2
      puts "A sword, made out of a leek. Increases power against monsters."
      ensure_purchase
      transaction(70, "leek sword")
    elsif response == 3
      puts "A can of tea. Replenishes health during battle once."
      transaction(80, "arizona tea")
    end
  elsif response == 2
    puts "Current function not available."
  else
    "Sorry, I didn't quite catch that..."
  end

  # TODO: make this work
  # puts "Are you done shopping? [y/n]"
  # response = gets
  # if response == /^[yY]/
  #   "Clerk: Ok, have a great day!\nYou decided to return to your base camp."
  #   home
  # else
  #   market
  # end

end



explore

home
