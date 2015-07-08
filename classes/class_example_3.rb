#!/usr/bin/env ruby

class Student
  def initialize(name, gender, major, exam_score)
    @name = name
    @gender = gender
    @major = major
    @exam_score = exam_score
  end

  def increaseScore(amount)
    exam_score += amount
  end

  def decreaseScore(amount)
    exam_score -= amount
  end

  def display
    puts "Name: " + @name
    puts "Gender: " + @gender
    puts "Major: " + @major
    puts "Exam Score: " + @exam_score.to_s
  end
end
