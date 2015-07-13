
def start
  puts "Hello!"
end

def enter
  print " [enter] "
  gets
  puts " "
end

def status
  puts "+========== STATUS ==========+"
  puts "   Name: #{$hero.name}"
  puts "   HP: #{$hero.hp.to_s} / #{$hero.maxhp.to_s}"
  puts "   Caste: #{$hero.caste}"
  puts "   Magic: #{$hero.magic.to_s}"
  puts "   Strength: #{$hero.strength.to_s}"
  puts "   Defense: #{$hero.defense.to_s}"
  puts "   Intelligence: #{$hero.intelligence.to_s}"
  puts "   Speed: #{$hero.speed.to_s}"
  puts "   Gems: #{$hero.gems.to_s}"
  puts "   Inventory: #{$hero.inventory.to_s}"
  puts "   Kills: #{$hero.monsters_killed.to_s}"
  puts "+===========================+"
  enter
end

def calc_days
  if $n_turns == 5
    $n_days += 1
    $n_turns = 0
  end
end

def confirm_choice(flag)
  print " [y/n]: "
  response = gets
  if response == "y"
    return
  elsif response == "n"
    if flag == 1
      get_name
    elsif flag == 2
      get_caste
    end
  end
end

def create_hero(name)
  $hero = Hero.new(name, 100, 100, "", 10, 10, 10, 10, 10, 50, [], 0)
end

def get_name
  puts "Well, what is your name?"
  choice = gets.chomp
  print "Your name is #{choice} correct?"
  confirm_choice(1)
  create_hero(choice)
end

def adventure_starting_text
  print "Beginning adventure...."
  enter
  status
end

def get_caste
  puts "What caste do you belong to?"
  puts "[1] Mage [2] Warrior [3] Knight"
  choice = gets.chomp
  if choice == "1" or "Mage".downcase
    print "So you prefer wands and potions, correct? "
    confirm_choice(2)
  elsif choice == "2" or "Warrior".downcase
    print "So you prefer clubs and maces, correct?"
    confirm_choice(2)
  elsif choice == "3" or "Knight".downcase
    print "So you prefer armor, correct?"
    confirm_choice(2)
  else
    puts "Sorry, I'm not sure I know what that is..."
  end
  $hero.caste = choice
  adventure_starting_text
end
