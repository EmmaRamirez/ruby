#!/usr/bin/env ruby

class Hero
  def initialize(name, hp, exp, level, hero_class, inventory, gems, strength, magic, defense)
    @name = name
    @hp = hp
    @exp = exp
    @level = level
    @hero_class = hero_class
    @inventory = inventory
    @gems = gems
    @strength = strength
    @magic = magic
    @defense = defense
  end

  def set_class(hero_class)
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

  def access_gems
    return @gems
  end

  def access_level
    return @level
  end

  def edit_gems(amount)
    @gems += amount
  end

  def edit_powers(strength, magic, defense)
    @strength += strength
    @magic += magic
    @defense += defense
  end

  def check_exp
    # TODO: better equation for exp level up
    if @exp > (100 * @level)
      level_up
      puts @name + " leveled up to level " + @level.to_s + "!"
    end
  end

  def status
    puts "\n+---- STATUS -----+"
    puts "  Name: " + @name
    puts "  HP: " + @hp.to_s + " / 100"
    puts "  Class: " + @hero_class
    puts "  Level: " + @level.to_s + " [" + @exp.to_s + " exp]"
    puts "  Inventory: " + (@inventory != [] ? "no items" : @inventory.to_s)
    puts "  Gems: " + @gems.to_s + " gems"
    puts "  Strength: " + @strength.to_s
    puts "  Magic: " + @magic.to_s
    puts "  Defense: " + @defense.to_s
    puts "+---- STATUS -----+"
    puts " "
  end
end
