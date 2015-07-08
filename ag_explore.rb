






def explore_if
  $current_monster = Monster.new(summon_monster(current_exploration), 5, 0, 0, 5, 0)
  puts "While exploring the " + current_exploration.to_s + ", you run into a #{$current_monster.species}!!"
  enter
  fight_decision
end

def explore
  puts "What will you do first?"

  if $market_ul == true
    puts "[1] Explore Forest\n[2] Explore Desert\n[3] Explore Plains\n[4] Visit Market"
  else
    puts "[1] Explore Forest\n[2] Explore Desert\n[3] Explore Plains\n"
  end

  explore_choice = gets.to_i
  if (explore_choice == 1)
    current_exploration = 'forest'
    explore_message('forest')
    $current_monster = Monster.new(summon_monster(current_exploration), 5, 0, 0, 5, 0)
    puts "While exploring the " + current_exploration.to_s + ", you run into a #{$current_monster.species}!!"
    enter
    fight_decision
  elsif (explore_choice == 2)
    current_exploration = 'desert'
    explore_message('desert')
    $current_monster = Monster.new(summon_monster(current_exploration), 5, 0, 0, 5, 0)
    puts "While exploring the " + current_exploration.to_s + ", you run into a #{$current_monster.species}!!"
    enter
    fight_decision
  elsif (explore_choice == 3)
    current_exploration = 'plains'
    explore_message('plains')
    $current_monster = Monster.new(summon_monster(current_exploration), 5, 0, 0, 5, 0)
    puts "While exploring the " + current_exploration.to_s + ", you run into a #{$current_monster.species}!!"
    enter
    fight_decision
  elsif (explore_choice == 4)
    market
  else
    reminder
    explore
  end
  # TODO: Implement correct grammar for 'an' instead of 'a' Imp, etc

end
