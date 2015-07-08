#!/usr/bin/env ruby

class Hero
  def initialize(name, hp, maxhp, exp, level, caste, inventory, gems, strength, magic, defense)
    @name = name
    @hp = hp
    @maxhp = maxhp
    @exp = exp
    @level = level
    @caste = caste
    @inventory = inventory
    @gems = gems
    @strength = strength
    @magic = magic
    @defense = defense
  end

  attr_accessor :maxhp, :exp, :level, :caste, :inventory, :gems, :strength, :magic, :defense

  def edit_hp(amount)
    # REVIEW: capping HP amount at 100
    @hp += amount
    if @hp > @maxhp
      @hp = @maxhp
    end
  end

  def full_heal
    @hp = @maxhp
  end

  def inventory_add(item)
    @inventory = @inventory.push(item)
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
      puts "You leveled up to level " + @level.to_s + "!"
    end
  end

  def status
    puts "\n+---- STATUS -----+"
    puts "  Name: " + @name
    puts "  HP: " + @hp.to_s + " / " + @maxhp.to_s
    puts "  Class: " + @caste
    puts "  Level: " + @level.to_s + " [" + @exp.to_s + " exp]"
    puts "  Inventory: " + (@inventory != [] ? @inventory.to_s : "no items")
    puts "  Gems: " + @gems.to_s + " gems"
    puts "  Strength: " + @strength.to_s
    puts "  Magic: " + @magic.to_s
    puts "  Defense: " + @defense.to_s
    puts "+---- STATUS -----+"
    puts " "
  end
end
