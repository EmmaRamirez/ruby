#!/usr/bin/env ruby

def load_file(file_name)
  intro_file = File.open(file_name, "r")
  whole_file = ""

  while (input_file = intro_file.gets)
    whole_file += input_file
  end

  puts whole_file
  intro_file.close()
end
