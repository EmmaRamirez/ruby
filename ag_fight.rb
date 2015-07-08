def calculate_bribe_cost
  $hero.access_level * 100
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
