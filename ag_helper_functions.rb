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

def beginning
  puts "Beginning adventure..."
  enter
  check_status
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
  $hero_name = gets.chomp.to_s
  if $hero_name != nil or $hero_name != ""
    puts "Hmm... #{$hero_name}? What a strange name. Well, then let me ask you..."
    ask_for_caste
  else
    puts "Please enter a valid name."
    get_name
  end
  enter
end
