#!/usr/bin/env ruby

class Hero
  def initialize(name, hp)
    @name = name
    @hp = hp
  end

  def status
    puts "Name: " + @name
    puts "HP: " + @hp.to_s
  end
end
