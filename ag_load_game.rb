#!/usr/bin/env ruby

def load_game_intro
  intro_file = File.open("data/adventure_1.txt", "r")
  whole_file = ""

  while (input_file = intro_file.gets)
    whole_file += input_file
  end

  puts whole_file
  intro_file.close()
end
