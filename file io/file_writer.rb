#!/usr/bin/env ruby

class FileWriter

  def initialize(file_name)
    @file = File.open(file_name, "w")
  end

  def write_line(output_line)
    @file.puts(output_line)
  end

  def close
    @file.close()
  end
end
