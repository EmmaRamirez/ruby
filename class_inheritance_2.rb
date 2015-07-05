#!/usr/bin/env ruby

require_relative 'class_example_3.rb'

class Intern < Student
  def initialize(name, gender, major, exam_score, job)
    super(name, gender, major, exam_score)
    @job = job
  end

  def changeJob(new_job)
    @job = new_job
  end

  def display
    puts "Name: " + @name
    puts "Gender: " + @gender
    puts "Major: " + @major
    puts "Exam Score: " + @exam_score
    puts "Job: " + @job
  end
end
