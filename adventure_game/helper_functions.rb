
def start
  puts "Hello!"
end

def enter
  print " [enter] "
  gets
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
  $hero = Hero.new(name, 100, 100, "", 10, 10, 10, 10, 10, [], 0)
end

def get_name
  puts "Well, what is your name?"
  choice = gets.chomp
  print "Your name is #{choice} correct?"
  confirm_choice(1)
  create_hero(choice)
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
end
