def home
  if $n_turns == 0 and $n_days == 0
    explore
  else
    puts "You decide to settle down for the time being. What will you do next?"
    if $n_turns < 4
      puts "[1] Explore [2] Market [3] Status [4] Rest"
    elsif $n_turns > 4
      puts "[3] Status [4] Rest"
    end
  end
end
