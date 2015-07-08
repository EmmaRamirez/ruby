#!/usr/bin/env ruby

class FileReader

  def initialize(file_name)
    @file = File.open(file_name, "r")
  end

  def read_file
    whole_file = ""
    while (input_line = @file.gets)
      whole_file += input_line
    end

    return whole_file
  end

  def display
    puts "Here are the file contents: "
    puts read_file
  end

  def close
    @file.close()
  end
end
