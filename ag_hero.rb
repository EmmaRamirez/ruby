#!/usr/bin/env ruby

class Hero
  def initialize(name, hp, exp, level, hero_class)
    @name = name
    @hp = hp
    @exp = exp
    @level = level
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

  def level_up
    @level += 1
  end

  def raise_exp(amount)
    @exp += exp
  end

  def status
    puts "+---- STATUS -----+"
    puts "  Name: " + @name
    puts "  HP: " + @hp.to_s + " / 100"
    puts "  Class: " + @hero_class
    puts "  Level: " + @level.to_s + " [" + @exp.to_s + "]"
    puts "+---- STATUS -----+"
  end
end