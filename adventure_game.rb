#!/usr/bin/env ruby

require_relative 'ag_load_file.rb'
require_relative 'ag_hero.rb'
require_relative 'ag_monster.rb'

current_exploration = ''
explore_choice = ''
$seed = rand(3)
$current_monster = ''
$areas_unlocked = ['forest', 'desert', 'plains']

# game intro screen
load_file("data/adventure_1.txt")

# puts "Hello there! Welcome to Rubydia, a magical world!\nTell me--what is your name?\n"

def reminder
  puts "Sorry, I didn't quite catch that. Only enter a number."
end

# This function is used so that the user isn't overwhelmed with a giant
# block of text all at once...usually!
def enter
  enter = gets
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
  puts "You decide to explore the " + place + "..."
end

def summon_monster(area)
  num = rand(3) - 1
  case area
  when 'forest'
    forestMonsters = ['Imp', 'Beehive', 'Argos']
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

def fight_attack_monster
  monster_strength_mod = 0
  hero_defense_mod = 0

  damage = $current_monster.strength + rand(3) - ($name.defense / 2) * -1
  $name.edit_hp(damage)
  puts "The #{$current_monster.species} attacked back!"
  puts "It inflicted #{damage * -1} damage!"

  if $name.hp < 0
    puts "***********************\n   You lost all your health!  \n************************"
    game_over
  elsif $name.hp < 20
    puts "You have #{$name.hp + damage} HP left..."
    puts "Maybe you should flee.\n [1] Flee [2] Keep Fighting"
    answer = gets
    if answer == 1
      puts "You decided to flee!"
    elsif answer == 2
      fight_attack
    else
      # TODO: make method you idiot
      "ERROR: NOT A VALID RESPONSE"
    end
  else
    puts "You have #{$name.hp} HP left."
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
  damage = base_damage + rand(10) + $name.strength * -1
  $current_monster.edit_hp(damage)
  puts "You inflicted #{damage * -1} damage!"
  # for debugging
  puts "The #{$current_monster.species} has " + $current_monster.hp.to_s + " HP left."
  puts " "

  if $current_monster.hp < 0
    puts "Congratulations! You defeated the monster!!"
  else
    fight_attack_monster
  end

end



def fight(monster)
  fight_screen_shown = false
  mon = monster

  if fight_screen_shown == false
    fight_screen
    fight_screen_shown = true
  end

  puts "[1] Attack [2] Use Spell"
  offense_choice = gets.to_i

  if offense_choice == 1
    fight_attack
  elsif offense_choice == 2
    fight_spell
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
      fight($current_monster)
    else
      $name.edit_gems((calculate_bribe_cost * -1))
      puts "Good thing you had the money!\nThe #{$current_monster.species} left in peace."
    end
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
  $current_monster = Monster.new(summon_monster(current_exploration), 5)
  puts "While exploring the " + current_exploration + ", you run into a #{$current_monster.species}!!"
  fight_decision
end

explore
