def enter
  print "[Press Enter]\n"
  enter = gets
end

def help
  load_file("data/adventure_3.txt")
  enter
end

def game_over
  load_file("data/adventure_2.txt")
end

def reminder
  puts "Sorry, I didn't quite catch that... Please re-enter"
end

def check_status
  $hero.status
end
