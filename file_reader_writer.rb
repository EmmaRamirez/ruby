#!/usr/bin/env ruby

require_relative = "file_reader.rb"
require_relative = "file_writer.rb"

fr = FileReader.new("data/file_test_3.txt")
fw = FileWriter.new("data/file_test_4.txt")

input = fr.read_file()
fw.write_line(input)

fw.close()
fr.close()
