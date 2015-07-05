#!/usr/bin/env ruby

class Hero
  def initialize(name, hp, hero_class)
    @name = name
    @hp = hp
    @hero_class = hero_class
  end

  def lower_hp(amount)
    @hp -= amount
  end

  def raise_hp(amount)
    if (@hp < 100)
      @hp += amount
    end
  end

  def status
    puts "+---- STATUS -----+"
    puts "  Name: " + @name
    puts "  HP: " + @hp.to_s
    puts "  Class: " + @hero_class
    puts "+---- STATUS -----+"
  end
end
