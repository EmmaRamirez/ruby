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







def calculate_bribe_cost
  $hero.access_level * 100
end

def game_over
  load_file("data/adventure_2.txt")
end

def flee
  puts "You decided to flee!"
end

def level_up

end

def fight_screen
  puts "+------------------+"
  puts "|    F I G H T!    |"
  puts "+------------------+"
end

def add_item(item)
  $hero.inventory_add(item.to_s)
  puts "You acquired a #{item.downcase}!"
end

def fight_spoils
  # 20% chance of receiving item after battle
  num = rand(5)

  if num == 1
    puts "In the rubble of the fight..."
    if ($current_monster.species == "Imp")
      add_item("tiny sword")
    else
      add_item("olixir potion")
    end
  end
end

def fight_attack_monster
  base_damage = 5
  monster_strength_mod = 0
  hero_defense_mod = 0
  hero_defense_divsion_mod = 3

  damage = (base_damage + $current_monster.strength + rand(5) - ($hero.defense / hero_defense_divsion_mod)) * -1
  $hero.edit_hp(damage)
  puts "|| The #{$current_monster.species} attacked back!"
  puts "|| It inflicted #{damage * -1} damage!"

  if $hero.hp < 0
    puts "***********************\n   You lost all your health!  \n************************"
    game_over
    return
  elsif $hero.hp < 20
    puts "|| You have #{$hero.hp + damage} HP left..."
    puts "|| Maybe you should flee.\n [1] Keep Fighting [2] Flee"
    answer = gets.to_i
    if answer == 2
      fight_attack
    elsif answer == 1
      puts " "
      puts "You decided to flee!"
    else
      # TODO: FIND SOMETHING TO PUT HERE
    end
  else
    puts "|| You have #{$hero.hp + damage} HP left."
    enter
    fight_attack
  end
end

def fight_attack
  base_damage = 10
  hero_strength_mod = 0
  # Get Strength & Defense of Hero
  # Get Strength of Monster
  if $hero.inventory.length > 0
    puts "You attacked the monster with your " + $hero.inventory[0].to_s
  else
    puts "You attacked the monster!"
  end

  # TODO: either add damage or strength boosters for inventory weapons
  # TODO: add critical hit ratio & implementation
  damage = (base_damage + rand(10) + $hero.strength) * -1
  $current_monster.edit_hp(damage)

  if $current_monster.hp < 0
    $current_monster.set_hp(0)
  end

  puts "You inflicted #{damage * -1} damage!"
  # for debugging
  puts "The #{$current_monster.species} has " + $current_monster.hp.to_s + " HP left."
  enter

  if $current_monster.hp <= 0
    $num_mons_killed += 1
    gems_acquired = $current_monster.strength * 2
    $hero.edit_gems(gems_acquired)
    exp_acquired = $current_monster.strength * 5
    $hero.edit_exp(exp_acquired)
    puts "Congratulations! You defeated the monster!!"
    puts "You gained #{exp_acquired.to_s} exp! [#{$hero.exp.to_s} total]"
    # TODO: make check_exp function that calls the method
    $hero.check_exp
    enter
    puts "You picked up #{gems_acquired.to_s} gems!"
    puts "You now have a total of #{$hero.access_gems.to_s} gems."
    fight_spoils
    enter
    if $num_mons_killed == 1
      $market_ul = true
      puts "New area [Market] unlocked! "
      enter
    end
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
    if (calculate_bribe_cost > $hero.access_gems)
      puts "But you don't have enought money!"
      puts "The #{$current_monster.species} attacked!"
      enter
      fight($current_monster)
    else
      $hero.edit_gems((calculate_bribe_cost * -1))
      puts "Good thing you had the money!\nThe #{$current_monster.species} left in peace."
    end
  else
    puts "Sorry, I didn't quite catch that..."
    fight_decision
  end
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
