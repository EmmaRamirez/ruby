#!/usr/bin/env ruby

class Hero
  def initialize(name, hp, exp, level, caste, inventory, gems, strength, magic, defense)
    @name = name
    @hp = hp
    @exp = exp
    @level = level
    @caste = caste
    @inventory = inventory
    @gems = gems
    @strength = strength
    @magic = magic
    @defense = defense
  end

  def set_class(caste)
    @caste = caste
  end

  def edit_hp(amount)
    # REVIEW: capping HP amount at 100
    @hp += amount
  end

  def set_hp(amount)
    @hp = amount
  end

  # FIXME: AWKWARD
  def name
    return @name
  end

  def inventory_add(item)
    @inventory = @inventory.push(item)
  end

  def level_up
    @level += 1
  end

  def inventory
    return @inventory
  end

  def strength
    return @strength
  end

  def hp
    return @hp
  end

  def edit_exp(amount)
    @exp += amount
  end

  def exp
    return @exp
  end

  def access_gems
    return @gems
  end

  def gems
    return @gems
  end

  def access_level
    return @level
  end

  def defense
    return @defense
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
      puts "You leveled up to level " + @level.to_s + "!"
    end
  end

  def status
    puts "\n+---- STATUS -----+"
    puts "  Name: " + @name
    puts "  HP: " + @hp.to_s + " / 100"
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
